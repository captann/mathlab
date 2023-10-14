figure('Name', 'plot() graph example', 'NumberTitle', 'off', 'Color', 'W');
x = linspace(0, 2* pi, 100);
y_cos = cos(x);
y_sin = sin(x);
y_exp = exp(x);


subplot(3, 1, 1);
plot(x, y_sin, 'c');
grid on
grid minor



subplot(3, 1, 2);
plot(x, y_exp, 'm:');
grid on
grid minor

subplot(3, 1, 3);
plot(x, y_cos, 'm--');
grid on
grid minor



title("Cosine graph", 'interpreter', 'latex', 'Fontsize', 14);
xlabel("$x$", 'interpreter', 'latex', 'FontSize', 14);
ylabel("$y$", 'interpreter', 'latex', 'FontSize', 14);
legend('$y = \cos(x)$', 'interpreter', 'latex', 'FontSize', 14 );
grid on;
grid minor;
