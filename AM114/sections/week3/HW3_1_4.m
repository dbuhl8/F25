clear all
close all

% \dot x  = r+0.5*x - x/(1+x)

x = 0:0.01:1;

f_nonlinear = x./(1+x);
figure(1)
plot(x,f_nonlinear,'b-','LineWidth', 1); grid on; hold on; 

rc = 1.5-sqrt(2);
plot(x,rc+0.5*x,'r-','LineWidth', 1);
plot(x,0.4*rc+0.5*x,'r:','LineWidth', 2);
plot(x,2*rc+0.5*x,'r-.','LineWidth', 2);

set(gca,'FontSize',14);
xlabel('x','FontSize', 14); 
legend('Interpreter', 'latex'); % Set the legend interpreter to LaTeX
legend({'$\frac{x}{1+x}$','$r_1+\frac{1}{x}$','$r_2+\frac{1}{x}$','$r_3+\frac{1}{x}$'},'fontsize',18,'Location', 'northwest')


%generate bifurcation diagram
figure(2);

x_ast = sqrt(2)-1;
x = x_ast-1:0.1:x_ast;
r = -0.5*x + x./(1+x);
plot(r,x,'b-','LineWidth', 1); grid on; hold on;

x = x_ast:0.1:x_ast+3;
r = -0.5*x + x./(1+x);
plot(r,x,'r--','LineWidth', 1);

legend('Interpreter', 'latex'); % Set the legend interpreter to LaTeX
legend({'stable','unstable'},'fontsize',18,'Location', 'northeast')
xlabel('r','FontSize', 18); ylabel('$x^*$','FontSize', 18,'Interpreter', 'latex'); 
