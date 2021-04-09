%% Storing variables
syms t;
x(t) = 	sin(4*t^2)*(5*t + (6*65^(1/2))/13);
y(t) = cos(4*t^2)*(5*t + (6*65^(1/2))/13);
z(t) = 	2*t*(65^(1/2)*t + 6);
T = 4;

%% Plotting curve
%fplot3(x(t), y(t), z(t), [0,T], 'Linewidth', 3);

%% Animation of point
%pts = linspace(0, 4*pi, 100);
%for k=1:length(pts)
%fplot3(x(t), y(t), z(t), [0,T], '-k', 'LineWidth', 2);
%hold on;
%plot3(x(pts(k)), y(pts(k)), z(pts(k)),'r.', 'MarkerSize', 30);
%hold off;
%M(k) = getframe;
%end
%movie(M)

%% length of curve
speed(t) = sqrt(diff(x(t),t)^2 + diff(y(t),t)^2 + diff(z(t),t)^2);
speedsim(t) = prod(sqrt(factor(simplify(expand(speed(t)^2)))));
%length = double(int(speedsim(t), t, 0, T))

%% finding g(s)
syms tau;
L(t) = int(speedsim(tau), tau, 0, t);
syms s;
solve(s == L(t), t);
assume(t, 'positive');
g(s) = subs(finverse(L(t)), t, s);

%% paramerizarion of r2(s)
x2(s) = x(g(s));
y2(s) = y(g(s));
z2(s) = z(g(s));

%% Plotting curve r2(s)
%fplot3(x2(s), y2(s), z2(s), [0,1.1435e+03],'-r', 'Linewidth', 3)

%% Animation of point r2(s)
%pts = linspace(0, 400, 100);
%for k=1:length(pts)
%fplot3(x2(s), y2(s), z2(s), [0,1.1435e+03], '-k', 'LineWidth', 2);
%hold on;
%plot3(x2(pts(k)), y2(pts(k)), z2(pts(k)),'r.', 'MarkerSize', 30);
%hold off;
%M(k) = getframe;
%end
%movie(M)

%% length of curve r2(s)
speed(s) = sqrt(diff(x2(s),s)^2 + diff(y2(s),s)^2 + diff(z2(s),s)^2);
speedsim(s) = prod(sqrt(factor(simplify(expand(speed(s)^2)))));
length2 = double(int(speedsim(s), s, 0, 1.1435e+03))


