close all 

%Intial conditions
x0 = [0,0.005,pi/12,-0.1,0,0.005];

%Initial Conditions: "Chaos in a Soda Can" AGREEMENT!
x0 = [0,0.3,pi/8,-0.8,pi,0];

%Define the parameters
p = parameters();

%Define the time limit + time vector
tLim =[0,5];
tSpan = linspace(tLim(1),tLim(2),1000000);

%Ode option
%Solver the ode with the mass matrix
[t,X] = ode15s(@(t,x) rocker_part10(t,x,p),tSpan,x0);

%Calculate the force on the contact point and the required coefficient of
%friction
F = zeros(length(X),2);
mu = zeros(length(X),1);

for i=1:length(X)
    [F_n,F_r] = friction(X(i,:),p);
    F(i,1) = F_n;
    F(i,2) = F_r;
    mu(i) = F(i,2)/F(i,1);
end

%Plot the results
figure 
subplot(4,2,1);
plot(t,X(:,3))
legend({'$\phi$'},'Interpreter','latex');

subplot(4,2,2);
plot(t,X(:,4))
legend({'$\dot{\phi}$'},'Interpreter','latex');

subplot(4,2,3);
plot(t,X(:,1))
legend({'$\psi$'},'Interpreter','latex');

subplot(4,2,4);
plot(t,X(:,2))
legend({'$\dot{\psi}$'},'Interpreter','latex');

subplot(4,2,5);
plot(t,X(:,5))
legend({'$\theta$'},'Interpreter','latex');

subplot(4,2,6);
plot(t,X(:,6))
legend({'$\dot{\theta}$'},'Interpreter','latex');

subplot(4,2,7);
plot(t,F(:,1));
legend({'Normal Force'},'Interpreter','latex');

subplot(4,2,8);
plot(t,F(:,2));
legend({'Friction force'},'Interpreter','latex');

figure
plot(t,mu)
legend({'Coefficient of Friction'},'Interpreter','latex')

figure
hold on
plot(X(:,2),X(:,6))
x = linspace(0,-20000,2);
y = -x;
plot(x,y,'r')
xlabel('dpsi')
ylabel('dtheta')

