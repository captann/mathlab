%%
A = randn(5);
[~, U] = sem_02_lu(A);

[C, D] = lu(A);

L = sem_02_ll(A);
[Q, R] = sem_02_qr(A, "gramm-schmidt modified");
[Q1,R1] = qr(A);
disp(Q);
disp(Q1);




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
%%

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

%%
function [Q, R] = sem_02_qr(A, name)
n = 5;
B = zeros(5, 5);
Q = zeros(5, 5);
R = zeros(5, 5);
B(1) = A(1);
switch name
    case "gramm-schmidt"
        for i=2:5
            s = 0;
            for k=1:i-1
                s = s + dot(B(k), (dot(A(i), B(k)) / dot(B(k), B(k))));
            end
            B(i) = A(i) - s;

        end
        for i=1:5
            Q(i) = B(i) / norm(B(i));
        end
        R = Q' * A;

    case "gramm-schmidt modified"
        b=zeros(5,5);
        % Ортогонализация
       for i=1:5
            for j=1:i-1
                B(:,i) = B(:,i) - dot(A(:,i),B(:,j)) / dot(B(:,j),B(:,j))*B(:,j);
            end
        B(:,i) = B(:,i) + A(:,i);
       end
       for i=1:5
            Q(i) = B(i) / norm(B(i));
        end
        R = Q' * A;
    case "hausholder"
        Q=eye(5);
R=A;
L=eye(5);

for i=1:4
e=zeros(5,1);
x=A(:,i);
if (i-1)>0
x(i-1,1)=0;
e(i,1)=1;
u=x-((norm(x))*e);
P=L-((2*(u*u'))/(norm(u)^2));
Q=Q*P;
A=P*A;
R=A;
elseif (i-1)==0
e(i,1)=1;
u=x-(norm(x)*e);
P=L-((2*(u*u'))/(norm(u)^2));
Q=Q*P;
A=P*A;
R=A;
end
end


    case "givens"
        I = eye(5, 5);
        Q = I;
        R = A;
        for i=1:n-1
            for j=1:n
                d = sqrt((A(i, i) ^ 2 + A(i, j) ^ 2));
                c = A(i, i) / d;
                s = A(i, j) / d;
                G = I;
                G(i, i) = c;
                G(j, i) = c;
                G(i, j) = s;
                G(j, j) = -s;
                A = G * R;
                R = A;
                Q = Q * G';
            end
        end



end
end

 


