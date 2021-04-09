%% center of mass of square with density 1
% square total mass
%syms x y 
%totalmass1 = int(int(1, x, -1, 1), y, -1, 1);
% moment at x coordinate
%momentx1 = int(int(x, x, -1, 1), y, -1, 1);
% moment at y coordinate
%momenty1 = int(int(y, x, -1, 1), y, -1, 1);
% center of mass coordinates
%x1coordinate = momentx/totalmass
%y1coordinate = momenty/totalmass

%% center of mass of square with density P(x,y)
%P= 1.082*x + 0.8395*y + 1.031*x*y + 1.24*x^2 + 1.156*y^2 + 9.969;
%square total mass
%totalmass2 = int(int(P, x, -1, 1), y, -1, 1);
%moment at x coordinate
%momentx2 = int(int(x*P, x, -1, 1), y, -1, 1);
% moment at y coordinate
%momenty2 = int(int(y*P, x, -1, 1), y, -1, 1);
% center of mass coordinates
%x2coordinate = momentx2/totalmass2
%y2coordinate = momenty2/totalmass2

%% center of mass of region between L(x) and f(x) with density 1
%f(x) = 9.542*x - 16.16*x^2 + 9.379*x^3 + 11.36*x^4 + 15.96;
%L(x) = 8.346*x + 30.99;
%region draw
%[xvals,yvals] = solve( L == f, [x,y] , 'Real', true);
%double(xvals);
%xVals = linspace(xvals(1), xvals(2), 100);
%xDraw = [xVals, fliplr(xVals)];
%yDraw = [double(L(xVals)), fliplr(double(f(xVals)))];
%figure(1)
%plot(xVals, double(L(xVals)));
%plot(xVals, double(f(xVals)));
%fill(xDraw, yDraw, 'r');
% region area, should be 58.2
%Area1 = int(L-f, x, xvals(1), xvals(2));
%double(Area1);
%moment at x coordinate
%momentx3 = int(int(y, y, f(x), L(x)), x, xvals(1), xvals(2));
% moment at y coordinate
%momenty3 = int(int(x, y, f(x), L(x)), x, xvals(1), xvals(2));
% center of mass coordinates
%x3coordinate = momentx3/Area1;
%y3coordinate = momenty3/Area1;

%% figure of region between f(x,y) and sphere
syms x y 
syms z
%f(x,y) = 0.5334*x^2 + 0.5334*y^2;
[zvals] = solve((z/0.5334) + z^2 == 4^2 ,[z], 'Real', true);
zvals = double(zvals);
%fimplicit3(f(x,y)==z,[-16,16,-16,16,zvals(1),zvals(2)])
%hold on
%fimplicit3(x^2+y^2+z^2==16,[-16,16,-16,16,zvals(2),16])

% volume of region, should be 37.65
syms r theta 
%vbottom = int(int(int(r, r, 0, ((z/0.5334)^(1/2))), z, 0, zvals(2)), theta,0,2*pi);
%vtop = int(int(int(r, r, 0, ((16-z^2)^(1/2))), z, zvals(2), 4), theta,0,2*pi);
%vbottom = double(vbottom)
%vtop = double(vtop)
%volume = double(vbottom+vtop)

% Total mass of region with denisty P(x,y,z)
P(x,y,z) = 4.612*x^3*y + 3.652*x*z^3 + 18.64;
g(theta,r,z) = subs(P, [x,y], [r*cos(theta), r*sin(theta)])
totalmassregion = int(int(int(g*r,z,0.5334*r^2,((16-r^2)^(1/2))),r,0,((zvals(2)/0.5334)^(1/2))),theta,0,2*pi);
totalmassregion = double(totalmassregion)
