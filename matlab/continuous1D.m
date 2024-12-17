densemu = @(x) 0.04 + 0.96 * (0.5 * normpdf(x, 0.2, 0.05) + 0.5 * normpdf(x, 0.4, 0.1));
densenu = @(x) 0.04 + 0.96 * (0.25 * normpdf(x, 0.55, 0.04) + 0.5 * normpdf(x, 0.7, 0.04) + 0.25 * normpdf(x, 0.85, 0.04));
Cmu = @(x) cummulative(densemu, x);
Cnu = @(x) cummulative(densenu, x);
T = @(x) invFunc(Cnu, Cmu(x));

grid = 200;
x = 0 : 1/grid : 1;
mu = densemu(x);
nu = densenu(x);
cmugraph = Cmu(x);
cnugraph = Cnu(x);
Tgraph = T(x);

plot(x, mu, 'k');
area(x, mu, 'FaceColor', 'r');
set(gca, 'DataAspectRatio', [1,9,1]);
ylim([0, 5]);
xticks([]);
yticks([]);
saveas(gca, 'mu.epsc');

clf
plot(x, nu, 'k');
area(x, nu, 'FaceColor', 'b');
set(gca, 'DataAspectRatio', [1,9,1]);
ylim([0, 5]);
xticks([]);
yticks([]);
saveas(gca, 'nu.epsc');

clf
plot(x, cmugraph, 'r', 'LineWidth', 2);
hold on
plot(x, cnugraph, 'b', 'LineWidth', 2);
set(gca, 'DataAspectRatio', [1,1,1]);
legend("$\mathcal{C}_\mu$", "$\mathcal{C}_\nu$", 'interpreter', 'latex', 'Location', 'SouthEast');
ylim([0, 1]);
xticks([]);
yticks([]);
saveas(gca, 'CmuCnu.epsc');

clf
plot(cmugraph, x, 'r', 'LineWidth', 2);
hold on
plot(cnugraph, x, 'b', 'LineWidth', 2);
set(gca, 'DataAspectRatio', [1,1,1]);
legend("$\mathcal{C}^{-1}_\mu$", "$\mathcal{C}^{-1}_\nu$", 'interpreter', 'latex', 'Location', 'SouthEast');
ylim([0, 1]);
xticks([]);
yticks([]);
saveas(gca, 'CinvmuCinvnu.epsc');

clf
plot(x, Tgraph, 'c', 'LineWidth', 2);
hold on
plot(Tgraph, x, 'm', 'LineWidth', 2);
set(gca, 'DataAspectRatio', [1,1,1]);
legend("$T$", "$T^{-1}$", 'interpreter', 'latex', 'Location', 'SouthEast');
ylim([0, 1]);
xticks([]);
yticks([]);
saveas(gca, 'TTinv.epsc');

clf
for t = 0 : 0.125 : 1
    cgraph = (1 - t) * cmugraph + t * cnugraph;
    plot(cgraph, x, 'color', [1-t, 0, t], 'LineWidth', 2);
    hold on
end
set(gca, 'DataAspectRatio', [1,1,1]);
ylim([0, 1]);
xticks([]);
yticks([]);
saveas(gca, 'Cinvtrans.epsc');

clf
xmidp = x + 0.5/grid;
xmidp = xmidp(1 : length(xmidp) - 1);
for t = 0 : 0.125 : 1
    disp(t);
    Tmid = @(a) t * T(a) + (1 - t) * a;
    graph = pushforward(Tmid, densemu, x);
    plot(xmidp, graph, 'color', [1-t, 0, t], 'LineWidth', 1);
    hold on
end
set(gca, 'DataAspectRatio', [1,9,1]);
ylim([0, 5]);
xticks([]);
yticks([]);
saveas(gca, 'transfer.epsc');

function y = cummulative(dense, x)
    y = zeros(size(x));
    n = length(x);
    for i = 1 : n
        y(i) = integral(dense, 0, x(i));
    end
end

function x = invFunc(f, y)
    x = zeros(size(y));
    n = length(y);
    for i = 1 : n
        l = 0;
        r = 1;
        while r - l > 1e-12
            mid = (l + r) / 2;
            tmp = f(mid);
            if tmp < y(i)
                l = mid;
            else
                r = mid;
            end
        end
        x(i) = l;
    end
end

function y = pushforward(T, densemu, x)
    n = length(x);
    p = invFunc(T, x);
    y = zeros(1, n - 1);
    for i = 1 : n-1
        y(i) = integral(densemu, p(i), p(i+1), 'AbsTol', 1e-9) / (x(i+1) - x(i));
    end
end