[c, n, err] = bisection_method(@(x) (2.*x.^3 + 3.*x - 1).*(cos(x)) - x, -1, 1, 10^-5, 100);
f = @(x) (2 .* x.^3 + 3 .* x - 1) .* cos(x);
a = -1; 
b = 1; 
tol = 10E-5; 
N = 100;
function [c,n,err] = bisection_method(f,a,b,tol,N)
    n = 0;
    err = tol + 1;
    while err > tol && n < N
        c = (a+b)/2;
        if f(a) * f(b) > 0
            break;
        end
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
        err = abs(a-b);
        if err < tol
            break
        end
        n = n + 1;
    end
    x = linspace(0, 1, 10000); 
    plot (x, f(x)); 
    hold on; 
    y = 0;
    line ([-1, 1], [y, y]); 
end

%There is 17 (n) iteration used
%error is 0.000008