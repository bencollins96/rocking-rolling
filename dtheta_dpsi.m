function y = dtheta_dpsi(x,p)

A = p.A; 
C = p.C;

%Define the constants as in my notes
P1 = (C*A + C*p.m*p.H^2 + A*p.m*p.R^2);
P2 = C*(p.m*p.R^2 + p.m*p.H^2 + A);
P3 = C*(C+p.m*p.R^2);
P4 = p.m*p.R*p.H*C;
P5 = P3 - P1 + A*p.m*p.R^2;

phi = x(3);

y_1 = -x(6)*(P3*cos(phi) - P4*sin(phi)) - x(2)*((P5/2)*cos(2*phi) -P4*sin(2*phi) + (1/2)*(P5 - 2*P1 - 2*A*p.m*p.R^2));

y_2 = P3*x(6)  + x(2)*((P3 - 2*P1)*cos(phi) - P4*sin(phi));


y = y_1/y_2;

end