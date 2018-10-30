function dx = rocker_part5(~,x,p)

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

c_phi = cos(phi);
s_phi = sin(phi);

A = p.A; C = p.C;

Q_22 = -(p.m*p.R^2 + p.m*p.H^2 + p.A);

f = s_phi*(C*A + C*p.m*p.H^2 + A*p.m*p.R^2);
g = C*(C+p.m*p.R^2)*dphi*dtheta + dpsi*dphi*(c_phi*(C^2 +C*p.m*p.R^2 -2*C*A - 2*A*p.m*p.R^2 - 2*C*p.m*p.H^2) - s_phi*p.m*p.H*p.R*C);

s2 = 0.5*(p.C-p.A+p.m*p.R^2-p.m*p.H^2)*(dpsi^2)*sin(2*phi)+(p.C+p.m*p.R^2)*dtheta*dpsi*s_phi ...
    + p.m*p.H*p.R*dpsi*dtheta*c_phi + p.m*p.H*p.R*(dpsi^2)*cos(2*phi) + p.m*p.g*(p.R*c_phi - p.H*s_phi);

h = c_phi*(C*(C+p.m*p.R^2)*dphi*dtheta + dpsi*dphi*(c_phi*(C^2 +C*p.m*p.R^2 -2*C*A - 2*A*p.m*p.R^2 -2 *C*p.m*p.H^2) - s_phi*p.m*p.H*p.R*C))...
    - s_phi*(p.m*p.R*p.H*C*dphi*dtheta + dpsi*dphi*((A*C + 2*A*p.m*p.R^2 + p.m*p.H^2*C)*s_phi + c_phi*(C*p.m*p.R*p.H)));

psi_eq   =  f^-1*g;
theta_eq = -f^-1*h;

dx = [x(2),psi_eq,x(4),(Q_22^-1)*s2,x(6),theta_eq]';
end
