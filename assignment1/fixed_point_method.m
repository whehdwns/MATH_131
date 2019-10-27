[c, n, err] = fixed_point_iteration(@(x) (exp(-x)), 0, 10^-10, 100);
[c1,n1,err1] = fixed_point_iteration(@(x) (1./(1+x)), 0,10^-10,100)
g = @(x) exp(-x);
g1 = @(x) 1/(1+x);
tol = 10^-10;
N = 100;
function [c,n,err] = fixed_point_iteration(g,x0,tol,N)
    n = 0;
    err = tol + 1;
    while err > tol && n < N
        c= g(x0);
        if abs(x0-c) < tol
            break;
        else
            x0 = c;
        end
        n = n + 1;
    end
    x = linspace(-1, 1, 10000);
    plot (x, g(x));
    hold on; 
    plot (x, x); 
end
%initial state guess about number of iteration for 1/(1+x): NO solution because it doesn't meet 0
%After I tested: 25 iteration