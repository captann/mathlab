figure('Name', 'plot() graph example', 'NumberTitle', 'off', 'Color', 'W');
t = linspace(-10, 10, 1000);
xt = exp(-t./10).*sin(5*t);
yt = exp(-t./10).*cos(5*t);
plot3(xt, yt, t);

[X, Y] = meshgrid(-5:.5:5);
Z = Y.* sin(X) - X.*cos(Y);
s = surf(X, Y, Z, 'FaceAlpha', 0.5)
xlabel("$x$", 'interpreter', 'latex', 'FontSize', 14);
ylabel("$y$", 'interpreter', 'latex', 'FontSize', 14);
legend('$y = \cos(x)$', 'interpreter', 'latex', 'FontSize', 14 );
grid on;
grid minor;
