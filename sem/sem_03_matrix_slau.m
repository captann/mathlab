
[H, L] = size(A);
b = [1, 1, 1]';
x = [2.2873, 2.2162, 2.3068]';
[x, ok] = sem_03_matrix(A, b, x);
disp(x);
x2 = sem_03_kramer(A, b, 3);
disp(x2);


function [x, ok] = sem_03_matrix(A, b, x0)
    [H, L] = size(A);
    ok = det(A) ~= 0;
    if ok
        A = adj_Matrix(A);
        A = reversed_Matrix(A);
        x = A * b;
    else
         x = zeros(H, L);
    end
end

function x=sem_03_kramer(A,b,n)
B=A;
for i=1:n
for j=1:n
B(j,i)=b(1,j);
end
disp (B)
x(1,i)=det(B)/det(A);
B=A;

end
end

function  [x, ok] = sem_03_gauss(A, b, x0)
    ok = (H == L);
    if ok
        disp('its_work');
    end


end

function  [x, ok] = sem_03_gauss_jordan(A, b, x0)
    ok = (H == L);
    if ok
        disp('its_work');
    end
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
            w = [hm ,lm, ha, la];
            M(hm, lm) = A(ha, la);
        end
    end
    result = det(M);
end

function U = adj_Matrix(A);
    [H, L] = size(A);
    U = zeros(H, L);
    % вычисление матрицы АД
    for i=1:H
        for j=1:L
            U(i, j) = ((-1) ^ (i + j)) * minor(A, i, j);
        end
    end

end

function R = reversed_Matrix(A)
    R = adj_Matrix(A') ./ det(A);
end


