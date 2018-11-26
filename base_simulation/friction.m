function [F_n,F_r] = friction(x,p)
%% Returns the friction force and the normal reaction, for calculation of the coefficient of friction.

dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

dx = rocker_part10(1,x,p);

ddpsi = dx(2);
ddphi = dx(4);
ddtheta = dx(6);

%The components of acceleration in e_x, e_y, e_z.
a_1 = -p.H*ddphi - p.R*dphi^2 - p.R*dpsi*dtheta*cos(phi) - p.R*(dpsi^2)*cos(phi)^2 + p.H*(dpsi^2)*cos(phi)*sin(phi);
a_2 = -2*p.R*dpsi*dphi*sin(phi) - 2*p.H*dpsi*dphi*cos(phi) - p.H*ddpsi*sin(phi) + p.R*ddtheta + p.R*ddpsi*cos(phi);
a_3 =  p.R*ddphi + p.R*dpsi*dtheta*sin(phi) + p.R*(dpsi^2)*sin(phi)*cos(phi) - p.H*dpsi^2*sin(phi)^2 - p.H*dphi^2;
a = [a_1;a_2;a_3];

%The vertical direction. 
e_z = [sin(phi);0; cos(phi)];

%Force is sum of acceleration and gravity multiplied by the disks mass
F = p.m*(a + p.g*e_z);

%Normal force is the force in the vertical direction.
F_n = dot(F,e_z);

%F_n = p.m*(p.g + a_1*sin(phi) + a_3*cos(phi));

%Friction force is the force in a horizontal direction.
F_r = norm(cross(F,e_z));

end