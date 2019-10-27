%First function of f1
f1 =@(x) (exp(-x.^2));
% data points of f1
datx = -3:1:3;
daty = f1(datx);
%Interpolate at the points
x = -3:0.01:3;
% Polynomial interpolant of f1
P5 = Newtons_divided_differences(x,datx,daty);

% plot the function
plot(x,f1(x));
hold on;
% plot the interpolants
plot(x',P5);
% plot the data set
scatter(datx,f1(datx));
hold off;

function y = Newtons_divided_differences(x,datx,daty)
    firstdatax = size(x,2);
    seconddatax = size(datx,2);
    F = ones(1,seconddatax);
    N = ones(1,firstdatax);
    for i = 1:seconddatax
        F(i) = daty(i);
    end
    for i = 2:seconddatax
         F(i:seconddatax) = (F(i:seconddatax)-F(i-1:seconddatax-1))./(datx(i:seconddatax)-datx(1:seconddatax-i+1));
    end
    y = N * F(seconddatax);
    for i = 1:seconddatax-1
        y = F(seconddatax-i) + (x-datx(seconddatax-i)).*y;
    end
    y=y';
end
%Compare your result with the one while interpolating with Lagrange_poly:
% When I compared between Lagrange_poly and Newton's divided Method, the result was same