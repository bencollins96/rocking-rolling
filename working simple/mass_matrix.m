function M = mass_matrix(~,x,p)

%Reassign variables for easy reading
s_phi = sin(x(3));
c_phi = cos(x(3));

q11 = p.m*p.R*p.H*c_phi - (p.A+p.m*p.H^2)*s_phi;
q13 = p.m*p.R*p.H;
q22 = p.A + p.m*p.R^2 + p.m*p.H^2;
q31 = p.m*p.R*p.H*s_phi - (p.m*p.R^2 + p.C)*c_phi;
q33 = -p.m*p.R^2 - p.C;

M = [1 ,  0  , 0 , 0   , 0 ,   0;
     0 , -q11 , 0 , 0   , 0 , -q13;
     0 ,  0  , 1 , 0   , 0 ,   0;
     0 ,  0  , 0 , -q22 , 0 ,   0;
     0 ,  0  , 0 , 0   , 1 ,   0;
     0 , -q31 , 0 , 0   , 0 , -q33];   
end