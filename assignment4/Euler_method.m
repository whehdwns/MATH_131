f =@(t,y) (sin(2*t)-2*t*y)/(t^2);
a = 1;
b = 5;
alpha = 2;

N1 = 10;
N2 = 10^2;
N3 = 10^3;

y0 = euler_method(f,a,b,alpha,N1);
y1 = euler_method(f,a,b,alpha,N2);
y2 = euler_method(f,a,b,alpha,N3);

t0 = (b-a)/N1;
t1 = (b-a)/N2;
t2 = (b-a)/N3;

x0 = a:t0:b;
x1 = a:t1:b;
x2 = a:t2:b;
plot(x0,y0, x1, y1, x2,y2);
%plot for graph
%loglog for error comparison

%syms y(t)
%eqn = diff(y,t) == (sin(2*t)-2*t*y)/(t^2);
%cond = y(1) == alpha;
%ySol(t) = dsolve(eqn,cond);
%eans = vpa(ySol(5));
% VPA
    % vpa(x) uses variable-precision floating-point arithmetic (VPA) 
    % to evaluate each element of the symbolic input x to at least d significant digits, 
    % where d is the value of the digits function. 
    % The default value of digits is 32.
% Exact Solution
% cos(2)/50 - cos(10)/50 + 2/25
eans = 0.088458493850586201305225914366466

err0 = abs(eans - y0);
err1 = abs(eans - y1);
err2 = abs(eans - y2);

loglog(err0);
hold on;
loglog(err1);
hold on;
loglog(err2);
hold off;

function y = euler_method(f,a,b,alpha,N)
    h = (b-a)/N;
    x = a:h:b;
    sx = size(x,2);
    y = ones(1,sx);
    y(1,1) = alpha;
    for i = 2:N+1
        y(1,i) = y(1,i-1) + h*f(x(1,i-1),y(1,i-1));
    end
    y=y';
end

%which method works best?
    %10^3 number of interval works best
%which method works the worst? 
    %10 number of interval works best
%Why?
    %As the number of interval increases, the answers get accurate