function [dx] = rocker(t,x)

m = 0.07; A = 5.1e-3;
C = 8e-3; g = 9.8;
R = 5.1e-2; H =6.9e-2;

x_1 = x(1); x_2 = x(2);
y_1 = x(3); y_2 = x(4);
z_1 = x(5); z_2 = x(6);

m_11 = (A+ m*H^2)*sin(y_2) - m*H*R*cos(y_2);
m_51 = -m*H*R;
m_33 = -m*R^2 - m*H^2 - A;
m_15 = C*cos(y_2) + m*R^2*cos(y_2) - m*R*H*sin(y_2);
m_55 = C + m*R*2;

f1 =(C-2*A -2*m*H^2)*x_1*y_1*cos(y_2) + C*y_1*z_1-2*m*H*R*x_1*y_1*sin(y_1);
f2 =(C-A+m*R^2-m*H^2)*x_1^2*sin(2*y_1)/2 + (C+m*R^2)*z_1*x_1*sin(y_2)...
     + m*H*R*x_1*z_1*cos(y_2) + m*H*R*x_1^2*cos(2*y_2);
f3 = C*x_1*y_1*sin(y_2) + 2*m*R*x_1*y_1*(R*sin(y_2) + H*cos(y_2));



mass_matrix = [m_11,    0,    0,    0, m_51,    0;...
               0   ,    1,    0,    0,    0,    0;...
               0   ,    0, m_33,    0,    0,    0;...
               0   ,    0,    0,    1,    0,    0;...
               m_15,    0,    0,    0, m_55,    0;...
               0   ,    0,    0,    0,    0,    1];
           
dx = mass_matrix\[f1,x_1,f2,y_1,f3,z_1]';

end