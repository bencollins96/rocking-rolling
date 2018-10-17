function dx = rocker(~,x)

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

s1 = dpsi*dphi*(2*m*R*H*s_phi + (2*m*H^2 + 2*A - C)*c_phi)- C*dphi*dtheta;
s2 = m*g*(H*s_phi - R*c_phi) + 0.5*(dphi^2)*sin(2*phi)*(A + m*H^2 - m*R^2 - C)...
     - (C+m*R^2)*dpsi*dphi*s_phi - m*H*R*(dphi^2)*cos(2*phi) - m*H*R*dphi*dpsi*c_phi;
s3 = -2*m*R*dphi*dpsi*(R*s_phi + H*c_phi) - C*dphi*dpsi*s_phi;

dx = [x(2),s1,x(4),s2,x(6),s3]';

end