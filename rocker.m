function [dx] = rocker(~,x)

m = 0.07;   A = 5.1e-3;
C = 8e-3;   g = 9.8;
R = 5.1e-2; H = 6.9e-2;

x_1 = x(1); x_2 = x(4);
y_1 = x(2); y_2 = x(5);
z_1 = x(3); z_2 = x(6);

%No other variables appear as cosine/sine
s = sin(y_2); c = cos(y_2);

m_11 = (A + m*H^2)*s - m*H*R*c;
m_31 = - m*H*R;
m_22 = - m*R^2 - m*H^2 - A;
m_13 = (C + m*R^2)*c - m*R*H*s;
m_33 = C + m*R*2;

f1 =(C - 2*A - 2*m*H^2)*x_1*y_1*c + C*y_1*z_1 - 2*m*H*R*x_1*y_1*s;
f2 =(C - A + m*R^2 - m*H^2)*(x_1^2)*sin(2*y_2)/2 + (C + m*R^2)*z_1*x_1*s...
     + m*H*R*x_1*z_1*c + m*H*R*x_1^2*cos(2*y_2) + m*g*(R*c - H*s);
f3 = C*x_1*y_1*s + 2*m*R*x_1*y_1*(R*s + H*c);
           
mass_matrix = [m_11,    0, m_31;...
               0   , m_22,    0;...
               m_13,    0, m_33];
           
matrix = blkdiag(mass_matrix,eye(3));

disp(det(matrix));
dx = matrix\[f1,f2,f3,x_1,y_1,z_1]';

end