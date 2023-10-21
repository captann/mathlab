A = [1 -0.2589 -0.3093;-0.2589  1 -0.2705;-0.3093 -0.2705 1];
b=[1 1 1];
x0=zeros(1,3);
[d1,ok1]=sem_03_gauss(A,b,3,x0);
fprintf('матрица 3х3 A=')
disp(A)
fprintf('вектор-столбец 1х3 b=')
disp(b)
[d2,ok2]=sem_03_gauss_jordan(A,b,3,x0);
[d3,ok3]=sem_03_kramer(A,b,3,x0);
b=[1; 1; 1];
[d4,ok4]= sem_03_matrix(A,b,x0);
method={'matrix';'kramer'; 'gauss' ;'gauss_jordan'};
solution=[d4';d3 ;d1 ;d2];
check=[ok4;ok1;ok2;ok3];
T=table(method,solution,check);
disp(T)


function [x, ok] = sem_03_matrix(A, b, x0)

    if det(A) ~= 0
        ok=true;

        A = reversed_Matrix(A);
        x = A * b;
    else
        ok=false;
        x = x0;
    end
end

function [x,ok]=sem_03_kramer(A,b,n,x0)
if (size(A,2)==size(A,1))
    if (det(A)~=0)
        ok=true;
        x=zeros(1,n);
        B=A;
        for i=1:n
            for j=1:n
                B(j,i)=b(1,j);
            end
            x(1,i)=det(B)/det(A);
            B=A;

        end
    else
        ok=false;
        x=x0;
    end
else
        ok=false;
        x=x0;
end
end

function [x,ok]=sem_03_gauss(A,b,n,x0)
if (size(A,2)==size(A,1))
    ok=true;
    x=zeros(1,n);
    for i=1:n
        for j=i+1:n
            k=A(j,i)/A(i,i);
            A(j,:)=A(j,:)-k*A(i,:);
            b(1,j)=b(1,j)-k*b(1,i);

        end
    end

    for i=n:-1:1

        x(1,i)=(b(1,i)-sum_1(A,x,i,n))/A(i,i);
    end
else
    ok=false;
    x=x0;
end
end

function s=sum_1(A,x,i,n)
s=0;

for k=i+1:n
    s=s+A(i,k)*x(1,k);
end

end


function [x,ok]=sem_03_gauss_jordan(A,b,n,x0)
if (size(A,2)==size(A,1))
    ok=true;
    x=zeros(1,n);
    for i=1:n
        for j=i+1:n
            k=A(j,i)/A(i,i);
            A(j,:)=A(j,:)-k*A(i,:);
            b(1,j)=b(1,j)-k*b(1,i);

        end
    end
    for i=n:-1:1
        for j=i-1:-1:1
        k=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-k*A(i,:);
        b(1,j)=b(1,j)-k*b(1,i);
        end
    end
    for i=n:-1:1

        x(1,i)=(b(1,i)-sum_1(A,x,i,n))/A(i,i);
    end
else
    ok=false;
    x=x0;
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