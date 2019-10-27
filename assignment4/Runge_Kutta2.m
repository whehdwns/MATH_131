%Second Order Runge-Kutta
f= @(t,y) -12*y;

a = 0;
b = 1;
alpha = 1;

N1 = 20;
N2 = 50;
N3 = 100;

y0 = RK2(f,a,b,alpha, N1);
y1 = RK2(f,a,b,alpha, N2);
y2 = RK2(f,a,b,alpha, N3);

t0 = (b-a)/N1;
t1 = (b-a)/N2;
t2 = (b-a)/N3;

x0 = a:t0:b;
x1 = a:t1:b;
x2 = a:t2:b;
plot(x0,y0, x1, y1, x2,y2);

%loglog for error comparison
%syms y(t)
%eqn = diff(y,t) == (sin(2*t)-2*t*y)/(t^2);
%cond = y(1) == alpha;
%ySol(t) = dsolve(eqn,cond);
%eans = vpa(ySol(5));
%Exact solution : 2*exp(-12*t)
eans = 0.000012288424706656419517364616357611;

err0 = abs(eans - y0);
err1 = abs(eans - y1);
err2 = abs(eans - y2);

loglog(err0);
hold on;
loglog(err1);
hold on;
loglog(err2);
hold off;

Err = [err0(N1+1),err1(N2+1),err2(N3+1)];

function y = RK2(f,a,b,alpha,N)
    h = (b-a)/N;
    t = a;
    y = 1:1:N;
    y(1) = alpha;
    for i = 2:1:N+1
        k1 = h*f(t,y(i-1));
        k2 = h* f(t+(h./2) , y(i-1)+(k1./2));
        y(i)= y(i-1)+k2;
    end
    y=y';   
end
%As the number of interval increases, the error decreases
%the method coverges