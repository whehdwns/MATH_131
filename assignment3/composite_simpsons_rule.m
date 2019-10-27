f =@(x) (cos((pi.*x.^2)./2));
a = 0;
b = pi;

n = [10^3,10^5];

I3 = composite_simpsons(f,a,b,n(1,1));
I4 = composite_simpsons(f,a,b,n(1,2));

eans =fresnelc(pi);

Err3 = abs(eans-I3);
Err4 = abs(eans-I4);

h1 = (b-a)/n(1,1);
h2 = (b-a)/n(1,2);

loglog(h1,Err3,'o-',h2,Err4,'o-');
grid on;
function I = composite_simpsons(f,a,b,n)
    h = (b-a)/n;
    x = a:h:b;
    y= 0;
    for i = 1:n/2-1
        if(i==1)
            y = y + ((f(x(1,i))+4.*f(x(1,i+1))+f(x(1,i+2))).*h)./3;
        else
            y = y + ((f(x(1,2.*i))+4.*f(x(1,2.*i+1))+f(x(1,2.*i+2))).*h)./3;
        end
    end
    I = y;
end
    

%which method works best between Trapezoid and Simpson's ? 
%I think Simpson works better than Trapezoid
%Which method works the worst? 
%Traezoid words worse than Simpson
%Error looks it is decreasing as the number of subintervals increases that leads to increase the accuracy