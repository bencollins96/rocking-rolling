x0 = [0,0.005,pi/6,-0.2,0,0.005];
tLim =[0,10];
tSpan = linspace(tLim(1), tLim(2),100000);

opts = odeset('Mass',@mass_matrix);

[t,X] = ode15s(@rocker2, tSpan,x0,opts);

subplot(3,2,1);
plot(t,X(:,3))
legend({'$\phi$'},'Interpreter','latex');

subplot(3,2,2);
plot(t,X(:,4))
legend({'$\dot{\phi}$'},'Interpreter','latex');

subplot(3,2,3);
plot(t,X(:,1))
legend({'$\psi$'},'Interpreter','latex');

subplot(3,2,4);
plot(t,X(:,2))
legend({'$\dot{\psi}$'},'Interpreter','latex');

subplot(3,2,5);
plot(t,X(:,5))
legend({'$\theta$'},'Interpreter','latex');

subplot(3,2,6);
plot(t,X(:,6))
legend({'$\dot{\theta}$'},'Interpreter','latex');