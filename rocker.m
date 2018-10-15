function [dx] = rocker(~,x)

m = 0.07;   A = 5.1e-3;
C = 8e-3;   g = 9.8;
R = 5.1e-2; H = 6.9e-2;

dpsi = x(1);   psi = x(4);
dphi = x(2);   phi = x(5);
dtheta = x(3); theta = x(6);

%No other variables appear as cosine/sine
s = sin(phi); c = cos(phi);

s1 =(C - 2*A - 2*m*H^2)*dpsi*dphi*c + C*dphi*dtheta - 2*m*H*R*dpsi*dphi*s;
s2 =(C - A + m*R^2 - m*H^2)*(dpsi^2)*sin(2*phi)/2 + (C + m*R^2)*dtheta*dpsi*s...
     + m*H*R*dpsi*dtheta*c + m*H*R*(dpsi^2)*cos(2*phi) + m*g*(R*c - H*s);
s3 = C*dpsi*dphi*s + 2*m*R*dpsi*dphi*(R*s + H*c);
           
dx = [s1,s2,s3,dpsi,dphi,dtheta]';

end