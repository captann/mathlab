A = [1, -0.2589, -0.3093;
    -0.2589, 1, -0.2705;
    -0.3093, -0.2705, 1
 ];
b = [1, 1, 1]';
x = [2.2873, 2.2162, 2.3068]';

sem_03_matrix(A, b, x);

function [x, ok] = sem_03_matrix(A, b, x0)
    ok = det(A) ~= 0;
    if ok
        disp('its_work');

    end

end

function  [x, ok] = sem_03_kramer(A, b, x0)

end

function  [x, ok] = sem_03_gauss(A, b, x0)
end

function  [x, ok] = sem_03_gauss_jordan(A, b, x0)
end

