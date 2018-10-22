function [F_n,F_t] = friction(x,p)
%% Returns the friction force and the normal reaction, for calculation of the coefficient of friction.

dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

dx = rocker(1,x,p);

ddpsi = dx(2);
ddphi = dx(4);
ddtheta = dx(6);

a_1 = -p.H*ddphi - p.R*dphi^2 - p.R*dpsi*dtheta*cos(phi) - p.R*(dpsi^2)*cos(phi)^2 + p.H*(dpsi^2)*cos(phi)*sin(phi);
a_3 = p.R*ddphi + p.R*dpsi*dtheta*sin(phi) + p.R*(dpsi^2)*sin(phi)*cos(phi) - p.H*dpsi^2*sin(phi)^2 - p.H*dphi^2;

F_n = p.m*(p.g + a_1*sin(phi) + a_3*cos(phi));

F_t = p.m*(a_1*cos(phi) - a_3*sin(phi));

end