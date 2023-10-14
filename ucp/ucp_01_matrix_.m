figure('Name', 'plot() graph example', 'NumberTitle', 'off', 'Color', 'W');
x = linspace(0, 2* pi, 100);
y = cos(x);
plot(x, y);
title("Cosine graph", 'interpreter', 'latex', 'Fontsize', 14);
xlabel("$x$", 'interpreter', 'latex', 'FontSize', 14);
ylabel("$y$", 'interpreter', 'latex', 'FontSize', 14);
legend('$y = \cos(x)$', 'interpreter', 'latex', 'FontSize', 14 );
grid on;
grid minor