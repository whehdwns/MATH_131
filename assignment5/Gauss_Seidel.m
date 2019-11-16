A = [-2  1   0   0   0; 
     2  10  -2   0   0; 
     0   2  -4   0   0; 
     0   0   0   2   1; 
     0   0   0  -3  -7];

b = [-5  3   3  -7  -8];
b = b.';

x0 = [0  0   0   0   0];
x0 = x0.';

Nmax = 100;
tol = 10^-5;
[x, err, N] = gauss_seidel(A, b, x0, tol, Nmax);
sol = A\b;
Err = abs(sol - x);
%Err =1.0e-05
%         0
%    0.0000
%         0
%    0.1602
%    0.0687
%Gauss Seidel solution can computed within 10^-5 places.
%N = 10
%The maximum number of iteration is 10.


function [x, err, N] = gauss_seidel(A, b, x0, tol, Nmax)
    D = diag(diag(A));
    L = zeros(size(A,1),size(A,1));
    U = zeros(size(A,1),size(A,1));
    err = tol + 1;
    N = 0;
    for i = 1:size(A,1)-1
        U(i,i+1:end) = A(i, i+1:end);
        L(i+1:end,i) = A(i+1:end,i);  
    end
    M = inv(D + L);
    while err > tol && N < Nmax
        N = N + 1;
        x = M*(-U*x0 + b);
        err = max(abs(x - x0));
        if err < tol
            break;
        else
            x0 = x;
        end
    end
end
