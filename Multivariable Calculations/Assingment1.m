p = [1,2,3];
q = [4,7,9];
r = [10,16,4];
pq = [q-p];
pr = [r-p];

% Finding v
% v is a vector that equals to the cross product of pqxpr 
% v is perpendicular to both pq & pr
% The dot product v.pq=0 & v.pr=0
m1 = [pq; pr];
v = [m1(1,2)*m1(2,3) - m1(1,3)*m1(2,2), -(m1(1,1)*m1(2,3) - m1(1,3)*m1(2,1)), m1(1,1)*m1(2,2) - m1(1,2)*m1(2,1)];


% Finding Angle 1 between pq & pr
magnitude_pq = sqrt(pq(1)^2 + pq(2)^2 + pq(3)^2);
magnitude_pr = sqrt(pr(1)^2 + pr(2)^2 + pr(3)^2);
dotproduct = (pq)*(pr');
Angle1= acos(dotproduct/(magnitude_pq*magnitude_pr));

% Finding Angle 2 between pq & pr
magnitude_v = sqrt(v(1)^2 + v(2)^2 + v(3)^2);
Angle2 = asin(magnitude_v/(magnitude_pq*magnitude_pr));

% Generating Figure
t= [1 0 0];
m2= [p;q];
m3=[p;v];
m4= [p;r];
m5= [p;q;r];

figure (1)
plot3 (p(1),p(2),p(3),'*');
hold on
plot3 (r(1),r(2),r(3),'O');
hold on
plot3 (m2(:,1),m2(:,2),m2(:,3));
hold on
plot3 (m4(:,1),m4(:,2),m4(:,3));
hold on
plot3 (m3(:,1),m3(:,2),m3(:,3));
hold off

figure(2)
plot3 (p(1),p(2),p(3),'*');
hold on
plot3 (r(1),r(2),r(3),'O');
hold on
fill3 (m5(:,1),m5(:,2),m5(:,3),t);
hold on
plot3 (m3(:,1),m3(:,2),m3(:,3));
hold off

% Finding equation of the plane
d = (v(1)*p(1) + v(2)*p(2) + v(3)*p(3));
% -79x+51y-3z = 14
% v.<x,y,z> = 14
% -79(x-1)+51(y-2)-3(z-3) = 0











