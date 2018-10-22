function dx = rocker2(~,x)

%Cylinder characteristics
m = 0.07; 
A = 5.1e-3;
C = 8e-3;
g = 9.8;
R = 5.1e-2;
H = 6.9e-2;

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

c_phi = cos(phi);
s_phi = sin(phi);

s1 = (C-2*A -2*m*H^2)*dpsi*dphi*c_phi +C*dphi*dtheta - 2*m*H*R*dpsi*dphi*s_phi;
s2 = 0.5*(C-A+m*R^2 - m*H^2)*(dpsi^2)*sin(2*phi)+(C+m*R^2)*dtheta*dpsi*s_phi ...
    + m*H*R*dpsi*dtheta*c_phi + m*H*R*(dpsi^2)*cos(2*phi) +m*g*(R*c_phi - H*s_phi);
s3 = C*dpsi*dphi*s_phi + 2*m*R*dpsi*dphi*(R*s_phi + H*c_phi);

dx = [x(2),s1,x(4),s2,x(6),s3]';


end
