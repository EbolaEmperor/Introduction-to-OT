global n;
n = 100;
eps = 1e-2;

zju = imread("../png/zju.jpg");
zju = rgb2gray(zju);
zju = imresize(zju, [n, n]);

mu = double(reshape(255 - zju, [n * n, 1])) + eps;
s1 = sum(mu);
mu = mu / s1 * n * n;

ustc = imread("../png/ustc.jpg");
ustc = rgb2gray(ustc);
ustc = imresize(ustc, [n, n]);

nu = double(reshape(255 - ustc, [n * n, 1])) + eps;
s2 = sum(nu);
nu = nu / s2 * n * n;

global pos;
pos = zeros(2, n*n);
for i = 1 : n
    for j = 1 : n
        pos(:,(i-1)*n+j) = [i; j];
    end
end
C = zeros(n*n, n*n);
for i = 1 : n*n
    C(i,:) = sum((pos - pos(:,i)).^2);
end

[cost, P] = sinkhorn(mu, nu, C, eps, 1e-5);

for t = 0 : 0.1 : 1
    t
    M = timeInterp(mu, P, t) * ((1-t) * s1 + t * s2) / (n * n) - eps
    M = floor(255 - M);
    clf;
    imshow(M);
    fname = sprintf("interp%.1f.epsc", t);
    saveas(gca, fname);
end

function M = timeInterp(mu, P, t)
    global n;
    global pos;
    l = n * n;
    M = zeros(n + 1, n + 1);
    for i = 1 : l
        for j = 1 : l
            tpos = (1-t) * pos(:,i) + t * pos(:,j);
            grid = floor(tpos);
            cf = tpos - grid;
            M(grid(1), grid(2)) = M(grid(1), grid(2)) + (1 - cf(1)) * (1 - cf(2)) * P(i, j);
            M(grid(1)+1, grid(2)) = M(grid(1)+1, grid(2)) + cf(1) * (1 - cf(2)) * P(i, j);
            M(grid(1), grid(2)+1) = M(grid(1), grid(2)+1) + (1 - cf(1)) * cf(2) * P(i, j);
            M(grid(1)+1, grid(2)+1) = M(grid(1)+1, grid(2)+1) + cf(1) * cf(2) * P(i, j);
        end
    end
    M = M(1:n, 1:n);
end