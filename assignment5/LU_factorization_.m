%LU factorization of a matrix A
%forward_substitution that solve the system Ly=b, 
%when L is a lower triangular matrix.
%7 x 7 linear System
A = [6  1  7  7  6  1  8;  
     7  5  5  2  7  8  7;   
     9  5  3  4  4  4  3;  
     9  8  1  6 -1  8  2;   
     1  4  5  3  3  3  7;  
     1  3  2  7  4  7  9; 
     6  6 -2  3  2  3  3];

b = [6  4  8  7  1  8  9];
b = b.';

[L,U] = LU_factorization(A);

y = forward_substitution(L,b);

x = backward_substitution(U,y);

x0 = A\b;

Err = abs(x0 - x);
%Err =1.0e-14 *
%    0.0111
%    0.0666
%    0.3997
%    0.1332
%    0.1554
%    0.0305
%    0.1776
%LU Factorization, Forward Subsitution, and Backward substitution solution can
%computed within 10^-14 places.

function [L,U] = LU_factorization(A)
    N = size(A,1);
    U = A;
    L = eye(N);
    for j =1:N-1
         if (A(j,j) == 0)
           p = find(A(:,j)~=0);
           tmp = A(j,:);
           ptmp = p(p~=i)
           A(j,:) = A(ptmp(1),:);
           A(ptmp(1),:) = tmp;
           index = ptmp(1);  
         else
             index = j+1;
         end 
        Tmp = eye(N);
        L(index:end,j) = A(index:end,j)/A(j,j);
        Tmp(index:end,j) = -A(index:end,j)/A(j,j);
        A = Tmp*A;
        U = A;
    end
end


function [x] = forward_substitution(L,b)
     N = size(L,1);
     x = zeros(N,1);
     x(1) = b(1)/L(1,1);
     for i = 2:N
         coeff = 0;
         for k = 1:i-1
             coeff = coeff + L(i,k)*x(k);
         end
         x(i) = (b(i) - coeff)/ L(i,i);
     end
 end

%Backward Subsitution from Gaussian Elimination
function x = backward_substitution(U,f)
     N = size(U,1);
     x = zeros(N,1);
     x(N) = f(N)/U(N,N);
     for i = 2:N
         j = N-(i-1);
         coeff = 0;
         for k = j+1:N
             coeff = coeff + U(j,k)*x(k);
         end
         x(j) = (f(j) - coeff)/ U(j,j);
     end
 end

