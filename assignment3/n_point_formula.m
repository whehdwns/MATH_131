%original function
f=@(x) (x.^2 -3.*x +2).*atan(x);
%derrivative function
fdx=@(x) (2.*x-3).*atan(x) + ((x.^2-3.*x+2) ./ (x.^2+1));
h =@(n) (10.^(-n));
n = [1,3,6];
x=0;
der= fdx(x);

%FD1, FD3, FD6 the result obtain with the forward difference
FD1 = forward_difference(f,x,h,n(1,1));
FD3 = forward_difference(f,x,h,n(1,2));
FD6 = forward_difference(f,x,h,n(1,3));

%CD31, CD33, CD36 the result obtain with the 3 point centered difference
CD31 = centered_difference_3pt(f,x,h,n(1,1));
CD33 = centered_difference_3pt(f,x,h,n(1,2));
CD36 = centered_difference_3pt(f,x,h,n(1,3));

%CD51, CD53, CD56 the result obtain with the 5 point centered difference
CD51 = centered_difference_5pt(f,x,h,n(1,1));
CD53 = centered_difference_5pt(f,x,h,n(1,2));
CD56 = centered_difference_5pt(f,x,h,n(1,3));

h=h(n);

%error : actual data - approximate data
%error for FD1, FD3, FD6
errorF = [abs(der-FD1), abs(der-FD3), abs(der-FD6)];
%error for CD31, CD33, CD36
errorC3 = [abs(der-CD31), abs(der-CD33), abs(der-CD36)];
%error for CD51, CD53, CD56
errorC5 = [abs(der-CD51), abs(der-CD53), abs(der-CD56)];

%Make a loglog plot of your error verses h
%Plot your error for all three methods on the same graph. 
loglog(h);

function [fp] = forward_difference(f,x,h,n)
    fp = (f(x+h(n))-f(x))./(h(n));
end

function [fp] = centered_difference_3pt(f,x,h,n)
    fp = (f(x+h(n))-f(x-h(n)))./(2.*h(n));
end

function [fp] = centered_difference_5pt(f,x,h,n)
    fp = (-f(x+2.*h(n))+8.*f(x+h(n))-8.*f(x-h(n))+f(x-2.*h(n)))./(12.*h(n));
end

%Explain your findings. 
%Is the error decreasing with h? Why or why not? 
%   the error seems to be decreasing when h increases and more subintervals
%Which method has the largest error? 
%   The largest error is forward difference formula
%Which method has the smallest error? 
%   The smallest error is 5 pt centered difference
%Why?
%   It shows how much points in the graph for those formula to estimate derivative of the function
