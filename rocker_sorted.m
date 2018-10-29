function dx = rocker_sorted(~,x,p)

%Reassign variables for easy reading
dpsi = x(2);
phi = x(3);
dphi = x(4);
dtheta = x(6);

c_phi = cos(phi);
s_phi = sin(phi);

mR2 = p.m*p.R^2;
mH2 = p.m*p.H^2;
mHR = p.m*p.H*p.R;
A = p.A;  C = p.C;


P1 = mR2 + mH2 + A;
P2 = s_phi*(C*A + C*mH2 + A*mR2);

S1 = -(P1^-1)*(0.5*(C - A + mR2 - mH2)*dpsi^2*sin(2*dphi)...
    + (C + mR2)*dpsi*dtheta*s_phi + mHR*dpsi*dtheta*c_phi...
    + mHR*dpsi^2*cos(2*phi) + p.m*p.g*(p.R*c_phi - p.H*s_phi));



S2 = (P2^-1)*(((C-2*A)*(C + mR2)*c_phi + mHR*C*s_phi)*dpsi*dphi...
     + C*(C+mR2)*dphi*dtheta);
 
S3 = -S2 -(P2^-1)*s_phi*(mHR*C*dtheta*dphi +...
    dphi*dpsi*(mHR*C*c_phi + s_phi*(A*C + mH2*C + 2*mR2*A)));

dx = [x(2),S1,x(4),S2,x(6),S3]';
end
