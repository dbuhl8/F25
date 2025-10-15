clear all
close all

% \dot x  = r*x - log(1+x); r>0

x = -0.9:0.01:4;

f_nonlinear = log(1+x);
figure(1)
plot(x,f_nonlinear,'b-','LineWidth', 1); grid on; hold on;

rc = 1;
plot(x,rc*x,'r-','LineWidth', 1); 
plot(x,0.5*rc*x,'r:','LineWidth', 2);  
plot(x,2*rc*x,'r-.','LineWidth', 2); 
xlim([-1 4]); ylim([-2.5 2.5]);
set(gca,'FontSize',15);
xlabel('x','FontSize', 15); 
legend({'ln(1+x)','x','0.5x','2x'},'fontsize',15)

legend('Interpreter', 'latex'); % Set the legend interpreter to LaTeX
legend({'$\log(1+x)$','$x$','$0.5x$','$2x$'},'fontsize',18,'Location', 'southeast')

%generate bifurcation diagram
figure(2);
x_ast = 0;

x = x_ast-1:0.01:x_ast;
r = log(1+x)./x;
plot(r,x,'b-',r,0*x,'r--','LineWidth', 1.5); grid on; hold on;

x = x_ast:0.01:x_ast+4;
r = log(1+x)./x;
plot(r,x,'r--',r,0*x,'b-','LineWidth', 1.5);


legend('Interpreter', 'latex'); % Set the legend interpreter to LaTeX
legend({'stable','unstable'},'fontsize',18,'Location', 'northeast')
xlabel('r','FontSize', 18); ylabel('$x^*$','FontSize', 18,'Interpreter', 'latex'); 
