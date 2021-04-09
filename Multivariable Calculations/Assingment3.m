%% plotting F(x,y)=0
%syms x y;
%F(x,y)=	6*x + 4*y - 3*x*y - 4*x^2 + 2*y^2 - 2;
%fimplicit(F(x,y) == 0,'LineWidth',3);
%hold on;

%% Finding points (A,y) on curve
%assume(y, 'real');

%xPt = -4.6;

%yPts = double(solve(F(xPt, y) == 0, y));

%% plotting F(x,y)=0 with tangent lines
%Fx(x,y) =diff(F,x); 
%Fy(x,y) = diff(F,y);
%yPt1 = yPts(1); 
%yPt2 = yPts(2);
%mx1 = double(Fx(xPt, yPt1)); 
%my1 = double(Fy(xPt, yPt1)); 
%mx2 = double(Fx(xPt, yPt2)); 
%my2 = double(Fy(xPt, yPt2));
%fimplicit(mx1*(x-xPt) + my1*(y-yPt1) == 0, '-r', 'LineWidth', 3);
%hold on;
%fimplicit(mx2*(x-xPt) + my2*(y-yPt2) == 0, '-g', 'LineWidth', 3);

%% finding tangent lines equation
%TLEQ1(x,y) = vpa(mx1*x + my1*y == (mx1*xPt + my1*yPt1));
%TLEQ2(x,y) = vpa(mx2*x + my2*y == (mx2*xPt + my2*yPt2));

%% finding y=h(x)
%syms x y;

%h(x,y) = 6*x + 4*y - 3*x*y - 4*x^2 + 2*y^2 - 2;

%solve(h == 0, y)

%% finding tangent line using calc1
%h1(x)= (3*x)/4 + (41*x^2 - 72*x + 32)^(1/2)/4 - 1;
%h1x = diff(h1, x);
%m = double(h1x(-4.6));
%% plotting g(x,y,z)=0
syms x y z;

g(x,y,z) = y - 6*x - 5*z + x*y - x*z + 4*y*z + 3*x^2 - 3*z^2 - 1;
figure(1)
fimplicit3(g(x,y,z) == 0);
hold on;
%% Finding points (B,C,z) on surface, B= xPt=9.8, C= yPt=6.9
assume(z, 'real');

xPt = 9.8;

yPt = 6.9;

zPt = double(solve(g(xPt, yPt, z) == 0, z));
%% Plotting g(x,y,z)=0 with tangent plane1 & 2

gx(x,y,z) = diff(g,x);

gy(x,y,z) = diff(g,y);

gz(x,y,z) = diff(g,z);
zPt1 = zPt(1); 
zPt2 = zPt(2);
mx1 = double(gx(xPt, yPt, zPt1)); 
my1 = double(gy(xPt, yPt, zPt1)); 
mz1 = double(gz(xPt, yPt, zPt1));
mx2 = double(gx(xPt, yPt, zPt2)); 
my2 = double(gy(xPt, yPt, zPt2)); 
mz2 = double(gz(xPt, yPt, zPt2));
fimplicit3(mx1*x + my1*y + mz1*z == (mx1*xPt + my1*yPt+mz1*zPt1),'-g');
hold on;
fimplicit3(mx2*x + my2*y + mz2*z == (mx2*xPt + my2*yPt+mz2*zPt2),'-r');

%% finding tangent planes equation
TPEQ1(x,y,z) = vpa(mx1*x + my1*y + mz1*z == (mx1*xPt + my1*yPt+mz1*zPt1))
TPEQ2(x,y,z) = vpa(mx2*x + my2*y + mz2*z == (mx2*xPt + my2*yPt+mz2*zPt2))
