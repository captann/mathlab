A = [1, -0.2589, 4;
    -0.2589,  1, -0.2705;
    -0.3093, -0.2705, 1;];
b = [1, 1, 1]';

x0 = zeros(3, 1);

[x, ok, k] = lab_01_gauss_seidel2(A, b, x0, 10^(-10), 10^3);
disp(k);
function [x, ok, k] = lab_01_gauss_seidel2(A, b, x0, eps, kmax)
    ok = true;
    n = size(A, 1);
    D = diag(diag(A));
    L = diag_Matrix(A, 'up');
    x = zeros(n);
    xp = x;
    
    k = 0;
    s1 = 0;
    while (k <= kmax) && ((norm(x - xp) > eps) || k == 0)
        xp = x;
        for i=1:n
            for j=1:i-1
                s1 = s1 + A(i, j) * x(j) / A(i, i);
            end
            for j=i+1:n
                s1= s1 + A(i, j) * xp(j) / A(i, i);
            end
            x(i) = (-s1 + b(i))/ A(i, i);
            s1 = 0;
        end
        k = k + 1;

    end
end


function s = sum2(C, x, n, k, i)
    s = 0;
    for j=i+1:n
        s = s + C(i, j) * x(j, k);
    end

end

function s = sum1(C, x, n, k, i)
    s = 0;
    for j=1:i-1
        s = s + C(i, j) * x(j, k);
    end
end




function [x, ok] = lab_01_gauss_seidel(A, b, x0, eps, kmax)
    % (L + D)Xk+1 = -UXk + B
    x = zeros(1, 3)';
    xp = zeros(1, 3)';
    L = diag_Matrix(A, 'up');
    U = diag_Matrix(A, 'down');
    D = diag(diag(A));
    B = -reversed_Matrix(D) * (L + U);
    k = 0;
    m = reversed_Matrix(L + D) % 3x3
    while ((k <= kmax) && gauss_seidel_stop(x, xp) > eps) || (k == 0)
        xp = x;
        k = k + 1;
        % -U * xp + B 3x3
        x = (-U * xp + B) * m;
    end
    ok =  gauss_seidel_stop(x, xp) < eps;
    gauss_seidel_stop(x, xp);
    if ok == false
        x = x0;
    end
end

function number = gauss_seidel_sums(C, D, x, k, i, j)
    number = 0;
    for j=1:i-1
        number = number + C(i, j) * x(j, k + 1);
    end
    for j=i+1:size(C, 1)
        number = number + C(i, j) * x(j, k) + D(i);
    end
end

function [x, ok] = lab_01_sor(A, b, x0, eps, kmax)
end
%
function [x, ok] = lab_01_smbcg(A, b, x0, eps, kmax)
end

function R = diag_Matrix(A, type)
    [H, L] = size(A);
    R = zeros(H, L);
    for h=1:H
        for l=1:L
            if (type == "up")
                if h <= l
                    R(h, l) = A(h, l);
                end
            else
                if h >= l
                    R(h, l) = A(h, l);
                end
            end
        end
    end
end

function R = reversed_Matrix(A)
    R = adj_Matrix(A') ./ det(A);
end

function result = minor(A, i, j)
    [H, L] = size(A);
    M = zeros(H - 1, L - 1);
    ha = 0;
    hm = 0;
    while (ha <= H)
        ha = ha + 1;
        hm = hm + 1;
        if (ha == i)
            ha = ha + 1;
        end
        if (ha > H)
            break;
        end
        la = 0;
        lm = 0;
        while (la <= L)
            la = la + 1;
            lm = lm + 1;
            if (la == j)
                la = la + 1;
            end
            if (la > L)
                break;
            end
            M(hm, lm) = A(ha, la);
        end
    end
    result = det(M);
end

function U = adj_Matrix(A)
    [H, L] = size(A);
    U = zeros(H, L);
    % вычисление матрицы АД
    for i=1:H
        for j=1:L
            U(i, j) = ((-1) ^ (i + j)) * minor(A, i, j);
        end
    end
end