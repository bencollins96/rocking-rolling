%Ode Script

x_0 = [0.005,-0.25,-0.005,0,pi/12,0];
t_span = [0,0.5];
t_vec = linspace(0,0.5,100000);

odeset = 

[t,X] = ode15s(@rocker,t_vec,x_0);

subplot(3,1,1);
plot(t,X(:,5));
legend({'$\dot{\phi}$','$\phi$'}, 'Interpreter','latex');
grid on

subplot(3,1,2);
plot(t,X(:,4));
legend({'$\dot{\psi}$','$\psi$'}, 'Interpreter','latex');

subplot(3,1,3);
plot(t,X(:,6));
legend({'$\dot{\theta}$','$\theta$'}, 'Interpreter','latex');

