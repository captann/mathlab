%%
A = randn(5);
[C, D] = sem_02_lu(A);

[C1, D1] = lu(A);
%disp(C * D - A);
%disp(C1 * D1 - A);

%L = sem_02_ll(A);
%disp(L);
[Q, R] = sem_02_qr(A, "givens");
[Q1,R1] = qr(A);
disp(Q * R - A);
disp(Q1 * R1 - A);

function [L, U] = sem_02_lu(A)
    L = zeros(5, 5);
    U = zeros(5, 5);
    for i=1:5
        for j=1:5
            U(i, j) = A(i, j) - find_sum_lu_1(i, j,  L, U);
        end
        L(i, i) = 1;
        for j=i + 1:5
            L(j, i) = (A(j, i) - find_sum_lu_2(i, j, L, U)) / (U(i, i));
        end
    end
end

function [Q, R]=sem_02_qr(A , name,n)
    n = 5;
    switch name
        case "gramm-schmid"
            Q=zeros(n);
            R=zeros(n);
            B=zeros(n);
            for i=1:n
                for j=1:n
                    B(j,i)=A(j,i)-find_sum_qr_1(i,j , A,B,n);
                end
            end
            for i=1:n
                for j=1:n
                    Q(j,i)=(B(j,i)/norm1(B,i,n));
                end
            end
            R=Q.'*A;
        case "gramm-schmidt modified"
            Q=zeros(n);
            R=zeros(n);
            B=zeros(n);
            for i=1:n
                for j=1:n
                    B(j,i)=A(j,i)-find_sum_qr_1(i,j , B,B,n);
                end
            end
            for i=1:n
                for j=1:n
                    Q(j,i)=(B(j,i)/norm1(B,i,n));
                end
            end
            R=Q.'*A;
        case "hausholder"
            Q=eye(n);
            R=A;
            for i=1:n-1
                e = zeros(n,1);
                x = A(:, i);
                for j = 1:i - 1
                    x(j, 1) = 0;
                end
                e(i, 1) = 1;
                u = x-norm(x)*e;
                P = eye(n)-2*u*u.'/norm(u)^2;
                Q = Q*P;
                A = P*A;
                R=A;
            end
        case "givens"
            Q = eye(n);
            G = eye(n);
            R = A;
            for i=1:n-1
                for j=i+1:n
                    d = sqrt(A(i, i) ^ 2 + A(j, i) ^ 2);
                    G(i, i) = A(i, i) / d;
                    G(j, j) = G(i, i);
                    G(i, j) = A(j, i) / d;
                    G(j, i) = -A(j, i) / d;
                end
            end
            Q = Q * G';
            A = G * R;
            R = A;
    end
end

function s = find_sum_lu_2(i, j,  L, U)
    s = 0;
    for k=1:(i - 1)
        s = s + L(j, k) * U(k, i);
    end
end

function s = find_sum_lu_1(i, j,  L, U)
    s = 0;
    for k=1:(i - 1)
        s = s + L(i, k) * U(k, j);
    end
end

function [L]=sem_02_ll(A)
    L=zeros(5);
    for i=1:5
        for j=1:i-1
            L(i,j)=(A(i,j)-find_sum_ll_1(i, L))/L(j,j);
        end
        L(i,i)=sqrt(A(i,i)-find_sum_ll_1(i, L));
    end
end

function s = find_sum_ll_1(i, L)
    s = 0;
    for k=1:(i - 1)
        s = s + L(i, k) * adjoint(L(i, k));
    end
end

function s = find_sum_qr_1(i,j,  A,B,n)
    s = 0;
    H=zeros(1,n);
    Z=zeros(1,n);
    for k=1:(i - 1)
        for t=1:n
            H(1,t)=A(i,t);
            Z(1,t)=B(t,k);
        end
        s = s + dot(H,Z)/dot(Z,Z)*B(j,k);
    end
end

function f=norm1(B,t,n)
    f=0;
    for i=1:n
        f=f+(B(i,t)*B(i, t));
    end
    f=sqrt(f);
end

 


