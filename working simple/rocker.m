function dx = rocker(~,x,p)

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

c_phi = cos(phi);
s_phi = sin(phi);

s1 = (p.C-2*p.A-2*p.m*p.H^2)*dpsi*dphi*c_phi + p.C*dphi*dtheta - 2*p.m*p.H*p.R*dpsi*dphi*s_phi;
s2 = 0.5*(p.C-p.A+p.m*p.R^2-p.m*p.H^2)*(dpsi^2)*sin(2*phi)+(p.C+p.m*p.R^2)*dtheta*dpsi*s_phi ...
    + p.m*p.H*p.R*dpsi*dtheta*c_phi + p.m*p.H*p.R*(dpsi^2)*cos(2*phi) + p.m*p.g*(p.R*c_phi - p.H*s_phi);
s3 = p.C*dpsi*dphi*s_phi + 2*p.m*p.R*dpsi*dphi*(p.R*s_phi + p.H*c_phi);

dx = [x(2),s1,x(4),s2,x(6),s3]';


end
