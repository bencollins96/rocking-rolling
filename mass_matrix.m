function [M] = mass_matrix(~,x)

m = 0.07;   A = 5.1e-3;
C = 8e-3;   g = 9.8;
R = 5.1e-2; H = 6.9e-2;

dpsi = x(1); psi = x(4);
dphi = x(2); phi = x(5);
dtheta = x(3); theta = x(6);

%No other variables appear as cosine/sine
s = sin(phi); c = cos(phi);

m_11 = (A + m*H^2)*s - m*H*R*c;
m_31 = - m*H*R;
m_22 = - m*R^2 - m*H^2 - A;
m_13 = (C + m*R^2)*c - m*R*H*s;
m_33 =  C + m*R*2;

mass_matrix = [m_11,    0, m_31;...
               0   , m_22,    0;...
               m_13,    0, m_33];
           
M = blkdiag(mass_matrix,eye(3));
           
end