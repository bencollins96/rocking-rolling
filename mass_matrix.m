function [M] = mass_matrix(~,x)

%Define the parameters
m = 0.07;   A = 5.1e-3;
C = 8e-3;   g = 9.8;
R = 5.1e-2; H = 6.9e-2;

phi = x(5);

%No other variables appear as cosine/sine
s_phi = sin(phi); c_phi= cos(phi);

m_11 = (A + m*H^2)*s_phi - m*H*R*c_phi;
m_13 = - m*H*R;
m_22 = - m*R^2 - m*H^2 - A;
m_31 = (C + m*R^2)*c_phi - m*R*H*s_phi;
m_33 =  C + m*R*2;

%Construct mass matrix for second derivatives
mass_matrix = [m_11,    0, m_13;...
               0   , m_22,    0;...
               m_31,    0, m_33];
           
%Construct mass matrix for all 6 variables.
M = blkdiag(mass_matrix,eye(3));
           
end