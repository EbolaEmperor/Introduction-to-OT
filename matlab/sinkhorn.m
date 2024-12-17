%% Log-Domain Sinkhorn
% Compute in the logarithm domain to avoid numerical overflow.
function [cost, couple] = sinkhorn(a, b, C, eps, Tol, N)
    if nargin < 6
        N = ceil((length(a) + length(b)) / eps);
    end
    if nargin < 5
        Tol = 1e-12;
    end
    n = length(a);
    m = length(b);
    f = zeros(n, 1);
    g = zeros(m, 1);
    for T = 1 : N
        disp(T)
        newf = zeros(n, 1);
        newg = zeros(m, 1);
        for i = 1 : n
            newf(i) = softmin(C(i,:) - g', eps) + eps * log(a(i));
        end
        for j = 1 : m
            newg(j) = softmin(C(:,j) - newf, eps) + eps * log(b(j));
        end
        if norm(newf - f) / norm(f) < Tol && norm(newg - g) / norm(g) < Tol
            fprintf("Sinkhorn converged in %d iterations.\n", T);
            break;
        end
        f = newf;
        g = newg;
    end
    couple = exp((f * ones(1, n) + ones(m, 1) * g' - C) / eps);
    cost = sum(sum(couple .* C));
end

function res = softmin(z, eps)
    zlow = min(z);
    res = zlow - eps * log( sum( exp(-(z - zlow) / eps) ) );
end