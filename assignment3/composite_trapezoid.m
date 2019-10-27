f =@(x) (cos((pi.*x.^2)./2));
a = 0;
b = pi;
%for the number of points n=10^3,10^5.
n = [10^3,10^5];

I1 = composite_trapezoid(f,a,b,n(1,1));
I2 = composite_trapezoid(f,a,b,n(1,2));
%exact answer to this integral can be computed using the Fresnel cosine integral in Matlab
eans = fresnelc(pi);

Err1 = abs(eans-I1);
Err2 = abs(eans-I2);
%h = (b-a)/n;
h1 = (b-a)/n(1,1);
h2 = (b-a)/n(1,2);

%loglog plot of error verses the number of points for both methods on the same plot.
loglog(h1,Err1,'o',h2,Err2,'o');
grid on;

%Chapter 4.4 (Composite Numerical Integration)
function I = composite_trapezoid(f,a,b,n)
    h = (b-a)/n;
    x = a:h:b; %create a vector of the values
    y= 0;
    for i = 1:n
        y = y + ((f(x(1,i))+f(x(1,i+1))).*h)./2;
    end
    I = y;
end