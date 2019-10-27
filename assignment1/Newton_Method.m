[c, n, err] = newtons_method(@(x) (atan(x) - 1), @(x) (1 / (1 + x^2)), 2, 10^-8, 100);
f = @(x) (atan(x) - 1);
fp = @(x) (1 / (1 + x^2));
tol = 10E-8;
x0 = 2;
N = 100;
function [c,n,err] = newtons_method(f, fp, x0, tol, N)
    n = 0;
    err = tol + 1;
    while err > tol && n < N
        x1 = x0-f(x0)/fp(x0);
        err = abs(x1-x0);
        if err < tol
            c = x1;
            break;
        else
            x0 = x1;
        end
        n = n + 1;
    end
     x = linspace(-10, 10, 10000); 
    plot (x, f(x));
    hold on; 
    y = 0; 
    line ([-10, 10], [y, y]); 
end