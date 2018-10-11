%Ode Script

x_0 = [0.005,0,-0.5,pi/6,0,0.005];
t_span = [0,1];

[t,X] = ode23s(@rocker,t_span,x_0);

subplot(3,1,1);
plot(t,X(:,1),t,X(:,2));
legend({'$\dot{\psi}$','$\psi$'}, 'Interpreter','latex');

subplot(3,1,2);
plot(t,X(:,3),t,X(:,4));
legend({'$\dot{\phi}$','$\phi$'}, 'Interpreter','latex');

subplot(3,1,3);
plot(t,X(:,5),t,X(:,6));
legend({'$\dot{\theta}$','$\theta$'}, 'Interpreter','latex');;

