% Fourth Order Runge-Kutta 
f= @(t,y) -12*y;

a = 0;
b = 1;
alpha = 1;

N1 = 20;
N2 = 50;
N3 = 100;

y3 = RK4(f,a,b,alpha, N1);
y4 = RK4(f,a,b,alpha, N2);
y5 = RK4(f,a,b,alpha, N3);

t0 = (b-a)/N1;
t1 = (b-a)/N2;
t2 = (b-a)/N3;

x0 = a:t0:b;
x1 = a:t1:b;
x2 = a:t2:b;
plot(x0,y3, x1, y4, x2,y5);

%loglog for error comparison
%syms y(t)
%eqn = diff(y,t) == (sin(2*t)-2*t*y)/(t^2);
%cond = y(1) == alpha;
%ySol(t) = dsolve(eqn,cond);
%eans = vpa(ySol(5));
%Exact solution : 2*exp(-12*t)
exact = @(t) 2*exp(-12*t);
%eans = 0.000012288424706656419517364616357611;
eans = exact(1);

err0 = abs(eans - y3);
err1 = abs(eans - y4);
err2 = abs(eans - y5);

loglog(err0);
hold on;
loglog(err1);
hold on;
loglog(err2);
hold off;

Err1 = [err0(N1+1),err1(N2+1),err2(N3+1)];

function y = RK4(f,a,b,alpha,N)
    h = (b-a)/N;
    t = a;
    y = 1:1:N;
    y(1) = alpha;
    for i = 2:1:N+1
        k1 = h*f(t,y(i-1));
        k2 = h* f(t+(h./2) , y(i-1)+(k1./2));
        k3 = h* f(t+(h./2) , y(i-1)+(k2./2));
        k4 = h* f(t+h, y(i-1)+k3);
        y(i)= y(i-1)+ k1/6 + (k2/3) + (k3/3) + (k4/6);
    end
    y=y';   
end
%As the number of interval increases, the error decreases
%the method coverges