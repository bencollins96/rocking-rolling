function dx = rocker_part7(~,x,p)

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

c_phi = cos(phi);
s_phi = sin(phi);

A = p.A; C = p.C;
P2 = (p.m*p.R^2 + p.m*p.H^2 + p.A);
P1 = (C*A + C*p.m*p.H^2 + A*p.m*p.R^2);

g = C*(C+p.m*p.R^2)*dphi*dtheta + dpsi*dphi*(c_phi*(C*(C+p.m*p.R^2) - 2*P1) - s_phi*p.m*p.H*p.R*C);

i = (dpsi^2)*(0.5*sin(2*phi)*(p.C-p.A+p.m*p.R^2-p.m*p.H^2)+cos(2*phi)*p.m*p.H*p.R) + dtheta*dpsi*((p.C+p.m*p.R^2)*s_phi ...
    + p.m*p.H*p.R*c_phi) + p.m*p.g*(p.R*c_phi - p.H*s_phi);

h = c_phi*(C*(C+p.m*p.R^2)*dphi*dtheta + dpsi*dphi*(c_phi*(C*(C+p.m*p.R^2) - 2*P1) - s_phi*p.m*p.H*p.R*C))...
    - s_phi*(p.m*p.R*p.H*C*dphi*dtheta + dpsi*dphi*((P1 + A*p.m*p.R^2)*s_phi + c_phi*(C*p.m*p.R*p.H)));

psi_eq   =  (s_phi*P1)^-1*g;
phi_eq   =  -P2^-1*i;
theta_eq = -(s_phi*P1)^-1*h;

dx = [x(2),psi_eq,x(4),phi_eq,x(6),theta_eq]';
end
