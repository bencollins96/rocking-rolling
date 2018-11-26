function dx = rocker(~,x,p)
%%The equations in this function are in the same form as on paper. 
%\dot{x} = f(x). No mass matrix.

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

%To reduce mistakes and shorten
c_phi = cos(phi);
s_phi = sin(phi);
A = p.A; C = p.C;

%Define the constants as in my notes
P1 = (C*A + C*p.m*p.H^2 + A*p.m*p.R^2);
P2 = C*(p.m*p.R^2 + p.m*p.H^2 + A);
P3 = C*(C+p.m*p.R^2);
P4 = p.m*p.R*p.H*C;
P5 = P3 - P1 + A*p.m*p.R^2;

%The 
g = P3*dphi*dtheta + dpsi*dphi*(c_phi*(P3 - 2*P1) - s_phi*P4);
i = (dpsi^2)*(0.5*P5*sin(2*phi)+P4*cos(2*phi)) + dtheta*dpsi*(P3*s_phi+ P4*c_phi) + p.m*p.g*C*(p.R*c_phi - p.H*s_phi);
h = dphi*dtheta*(P3*c_phi -P4*s_phi) + dpsi*dphi*(0.5*P5*cos(2*phi) - P4*sin(2*phi) + 0.5*(P5-2*P1-2*A*p.m*p.R^2));

psi_eq   =  (s_phi*P1)^-1*g;
phi_eq   =  -P2^-1*i;
theta_eq = -(s_phi*P1)^-1*h;

dx = [x(2),psi_eq,x(4),phi_eq,x(6),theta_eq]';
end
