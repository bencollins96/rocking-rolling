function dx = rocker_part(~,x,p)

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

c_phi = cos(phi);
s_phi = sin(phi);

Q_11 = (p.A + p.m*p.H^2)*s_phi - p.m*p.H*p.R*c_phi;
Q_13 = -p.m*p.H*p.R;
Q_22 = -(p.m*p.R^2 + p.m*p.H^2 + p.A);
Q_31 = (p.C + p.m*p.R^2)*c_phi - p.m*p.R*p.H*s_phi;
Q_33 = p.C + p.m*p.R^2;

s1 = (p.C-2*p.A-2*p.m*p.H^2)*dpsi*dphi*c_phi + p.C*dphi*dtheta - 2*p.m*p.H*p.R*dpsi*dphi*s_phi;
s2 = 0.5*(p.C-p.A+p.m*p.R^2-p.m*p.H^2)*(dpsi^2)*sin(2*phi)+(p.C+p.m*p.R^2)*dtheta*dpsi*s_phi ...
    + p.m*p.H*p.R*dpsi*dtheta*c_phi + p.m*p.H*p.R*(dpsi^2)*cos(2*phi) + p.m*p.g*(p.R*c_phi - p.H*s_phi);
s3 = p.C*dpsi*dphi*s_phi + 2*p.m*p.R*dpsi*dphi*(p.R*s_phi + p.H*c_phi);

psi_eq   =  (Q_11*Q_33 - Q_31*Q_13)^-1*(s1*Q_33 - s3*Q_13);
theta_eq = -(Q_11*Q_33 - Q_31*Q_13)^-1*(s1*Q_31 - s3*Q_11);

dx = [x(2),psi_eq,x(4),(Q_22^-1)*s2,x(6),theta_eq]';
end