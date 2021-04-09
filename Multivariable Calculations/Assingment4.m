%% storing the two functions f and g
 syms x y z w
 f =	w*z - 5.0*x - 3.0*y - 3.0*z - 4.0*w - 3.0*x*y + 4.0*w^2;
 g = 0.08406*w*x + 0.04726*w*y + 0.02025*w*z + 0.2382*x*y + 0.1021*x*z + 0.05739*y*z + 0.4607*w^2 + 0.3535*x^2 + 0.06697*y^2 + 0.513*z^2;
 
 %% points where gradient f is zero
Dfx = diff(f,x);

Dfy = diff(f,y);

Dfz = diff(f,z);

Dfw = diff(f, w);

[xSols, ySols, zSols, wSols] = solve([Dfx == 0, Dfy == 0, Dfz == 0, Dfw == 0], [x,y,z,w],'Real', true);

%% Determine whether points lie in region
Dgx = diff(g,x);

Dgy = diff(g,y);

Dgz = diff(g,z);

Dgw = diff(g,w);

val = subs(g, [x,y,z,w], [xSols(1), ySols(1), zSols(1),wSols(1)]);

%% Determine critical points using Lagrange multipliers
syms L 
assume(L, 'real');
[LSols2, xSols2, ySols2, zSols2, wSols2 ] = vpasolve([Dfx == L*Dgx, Dfy == L*Dgy, Dfz == L*Dgz, Dfw == L*Dgw, g == 1], [L,x,y,z,w]);

%% Value of f at critical points
viablePts = zeros(4, 1);

nextPt = 1;

for count = 1:length(xSols2)
    
viablePts(1, nextPt) = xSols2(count);

viablePts(2, nextPt) = ySols2(count);

viablePts(3, nextPt) = zSols2(count);

viablePts(4, nextPt) = wSols2(count);
nextPt = nextPt + 1;
end


for count = 1:length(viablePts(1,:))

fVals(count) = subs(f, [x;y;z;w], viablePts(:,count));

end

%% Determine the max and min
[maxVal, maxInd] = max(fVals)
[minVal, minInd] = min(fVals)

viablePts(:, maxInd)
viablePts(:, minInd)
