clear all
close all

% \dot x  = r+x-log(1+x);

x = -1:0.01:3;
f = log(1+x);

figure(1);
plot(x,f,'b-','LineWidth', 1); grid on; hold on; 

rc = 0;
plot(x,rc-1+x,'r:','LineWidth', 2);
plot(x,rc-0+x,'r-','LineWidth', 1);
plot(x,rc+1+x,'r-.','LineWidth', 2);

legend('Interpreter', 'latex'); % Set the legend interpreter to LaTeX
legend({'$y=\log(1+x)$','$y=-1+x$','$y=x$','$y=1+x$'},'fontsize',18,'Location', 'southeast')
set(gca,'FontSize',18);
xlabel('x','FontSize', 18); 
xlim([-1.5 3.5]); 
ylim([-2.5 2])


%generate bifurcation diagram
figure(2);
x = -1:0.1:0;
r = log(1+x)-x;
plot(r,x,'b-','LineWidth', 1); grid on; hold on;

x = 0:0.1:3;
r = log(1+x)-x;
plot(r,x,'r--','LineWidth', 1);

legend('Interpreter', 'latex'); % Set the legend interpreter to LaTeX
legend({'stable','unstable'},'fontsize',18,'Location', 'northeast')
xlabel('r','FontSize', 18); ylabel('$x^*$','FontSize', 18,'Interpreter', 'latex'); 

