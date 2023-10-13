
%%
clc
clear variables
close all
k = 5;
A = randn(5);
times = zeros(1, 5000);
for number=1:5000
    tic
    sem_01_expm(A, 10)
    t = toc;
    times(1, number) = t;
end
times2 = zeros(1, 4000);
for i=501:4500
    times2(1, i - 500) = times(1, i);
end

median = median(times2);
disp(median);


correct = expm(A);
vectror = zeros(1, 15);
for k=1:15
    disp(k + "---");
    B = sem_01_expm(A, k);
    vector(1, k) = norm(B - correct);
    disp(correct);
    disp(B);
    
end
bar(vector);

function [B] = sem_01_expm(A, k)
    B = 0;
    for i=0:k
        B = B + (1  / factorial(i)) * A^i;
    end
end



