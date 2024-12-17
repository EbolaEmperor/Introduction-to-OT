densemu = @(x) 0.1 + 0.9 * (0.75 * normpdf(x, 0.6, 0.05) + 0.25 * normpdf(x, 0.75, 0.03));
densenu = @(x) 0.1 + 0.9 * normpdf(x, 0.25, 0.06);

grid = 300;
eps = 1e-3;

x = 0 : 1 / grid : 1;
discmu = densemu(x)';
discnu = densenu(x)';
discmu = discmu / sum(discmu);
discnu = discnu / sum(discnu);

C = zeros(grid + 1, grid + 1);
for i = 1 : grid + 1
    for j = 1 : grid + 1
        C(i, j) = abs(x(i) - x(j)) ^ 2;
    end
end

[cost, cp] = sinkhorn(discmu, discnu, C, eps);
fprintf("total cost: %.6f\n", cost);

[xmesh, ymesh] = meshgrid(x, x);
g1 = pcolor(xmesh, ymesh, cp');
xticks([]);
yticks([]);
set(g1, 'linestyle', 'none');
set(gca, 'DataAspectRatio', [1,1,1]);
% saveas(gca, "iter1000.epsc");