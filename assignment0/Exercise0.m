
x1 = myalternatesum1(20)
x2 = myalternatesum1(100)
x3 = myderivative(1.1)
function result = myalternatesum1(n)
    result =0;
    for i = 1: n
        result = result + i*((-1)^i);
    end
 %   fprintf('%f', result);
end
%pseudocode
%input x
%output y
%function myalternatesum
%   for i is equal to 1 and go up to n
%       result = result + i*((-1)^i)) from formula
%end 

%f= @(x) 0.5*(x-1).^2;
%format long
%format short
%f(sqrt(3))

%f= @(x) (x-1).^2;
%h =@(x,h)(f(x+h)-f(x))/h;
%h(1.1, 0.01)
%h(1.1,0.001)


function result = myderivative(x)
    result= 0.5*(x-1).^2;
end
%f= @(x) 0.5*(x-1).^2;
%h =@(x,h)(f(x+h)-f(x))/h;
%h(1.1, 0.1)
%h(1.1, 0.01)