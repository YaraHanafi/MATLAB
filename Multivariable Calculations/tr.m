syms t;

x(t) = 5*cos(2*t) + 5*sin(t);

y(t) = 2*cos(2*t) + 4*cos(t);

z(t) = sin(3*t) + 4*sin(t);

speed(t) = sqrt(diff(x(t),t)^2 + diff(y(t),t)^2 + diff(z(t),t)^2);
speedsim(t) = prod(sqrt(factor(simplify(expand(speed(t)^2)))));
length = double(int(speed(t), t, 0, 2*pi))
