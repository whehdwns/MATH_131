%gaussian elimination of linear system of the form Ax =b
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
[U,f] = gaussian_elimination(A,b);

x = backward_substitution(U,f);

x0 = A\b;

Err = abs(x0 - x);
%Err = 1.0e-14 *
%    0.0111
%    0.1110
%    0.4219
%    0.1554
%    0.1554
%    0.0555
%    0.1776
%Gaussian Elimination and Backward substitution solution can
%computed within 10^-14 places.

function [U,f] = gaussian_elimination(A,b)
    N = size(A,1);
    for j =1:N
        if (A(j,j) == 0)
           p = find(A(:,j)~=0);
           tmp = A(j,:);
           ptmp = p(p~=j);
           A(j,:) = A(ptmp(1),:);
           A(ptmp(1),:) = tmp;
            tmp2 = b(j);
            b(j) = b(ptmp(1),:);
            b(ptmp(1)) = tmp2;
            for i = ptmp(1):N
                b(i) = b(i)- A(i,j)/A(j,j)*b(j);
                A(i,:) = A(i,:) - A(i,j)/A(j,j)*A(j,:);
            end
        else
            for i = j+1:N
                b(i) = b(i)- A(i,j)/A(j,j)*b(j);
                A(i,:) = A(i,:) - A(i,j)/A(j,j)*A(j,:);
            end
        end

    end
    U = A;
    f = b;
end


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
