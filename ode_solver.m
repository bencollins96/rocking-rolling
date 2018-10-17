%Ode Script

x_0 = [0.005,-0.5,0.005,0,pi/6,0];
t_span = [0,0.5];
t_vec = linspace(t_span(1),t_span(2),10000);

opts = odeset('Mass', @mass_matrix, 'MassSingular', 'maybe');
[t,X] = ode15s(@rocker,t_vec,x_0,opts);

subplot(3,2,1);
plot(t,X(:,5));
legend({'$\phi$'}, 'Interpreter','latex');
grid on

subplot(3,2,2);
plot(t,X(:,2));
legend({'$\dot{\phi}$'}, 'Interpreter','latex');
grid on

subplot(3,2,3);
plot(t,X(:,4));
legend({'$\psi$',}, 'Interpreter','latex');

subplot(3,2,4);
plot(t,X(:,1));
legend({'$\dot{\psi}$'}, 'Interpreter','latex');

subplot(3,2,5);
plot(t,X(:,6));
legend({'$\theta$'}, 'Interpreter','latex');

subplot(3,2,6);
plot(t,X(:,3));
legend({'$\dot{\theta}$'}, 'Interpreter','latex');