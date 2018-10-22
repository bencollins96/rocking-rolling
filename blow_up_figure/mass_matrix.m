function M = mass_matrix(~,x)

%Cylinder characteristics
m = 0.07; 
A = 5.1e-3;
C = 8e-3;
g = 9.8;
R = 5.1e-2;
H = 6.9e-2;

%Reassign variables for easy reading
s_phi = sin(x(3));
c_phi = cos(x(3));

q11 = m*R*H*c_phi - (A+m*H^2)*s_phi;
q13 = m*R*H;
q22 = A + m*R^2 + m*H^2;
q31 = m*R*H*s_phi - (m*R^2 + C)*c_phi;
q33 = -m*R^2 - C;



M = [1 ,  0  , 0 , 0   , 0 ,   0;
     0 , -q11 , 0 , 0   , 0 , -q13;
     0 ,  0  , 1 , 0   , 0 ,   0;
     0 ,  0  , 0 , -q22 , 0 ,   0;
     0 ,  0  , 0 , 0   , 1 ,   0;
     0 , -q31 , 0 , 0   , 0 , -q33];

     
end