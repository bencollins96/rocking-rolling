function [dx] = rocker(~,x)

%Define parameters
m = 0.07;   A = 5.1e-3;
C = 8e-3;   g = 9.8;
R = 5.1e-2; H = 6.9e-2;

%redefine variables for easy reading.
dpsi = x(1); 
dphi = x(2);   
phi = x(5);
dtheta = x(3); 

%No other variables appear as cosine/sine
s_phi = sin(phi); c_phi = cos(phi);

s1 =(C - 2*A - 2*m*H^2)*dpsi*dphi*c_phi + C*dphi*dtheta - 2*m*H*R*dpsi*dphi*s_phi;
s2 =0.5*(C - A + m*R^2 - m*H^2)*(dpsi^2)*sin(2*phi) + (C + m*R^2)*dtheta*dpsi*s_phi...
     + m*H*R*dpsi*dtheta*c_phi + m*H*R*(dpsi^2)*cos(2*phi) + m*g*(R*c_phi - H*s_phi);
s3 = C*dpsi*dphi*s_phi + 2*m*R*dpsi*dphi*(R*s_phi + H*c_phi);
           
dx = [s1,s2,s3,dpsi,dphi,dtheta]';

end