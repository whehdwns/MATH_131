%----------first function f1-------------
f1 =@(x) (exp(-x.^2));
% data point for f1
datx = -3:1:3;
daty = f1(datx);
% points to interpolate f1
x = -3:0.01:3;
% Lagrange interpolant of f1
P1 = Lagrange_poly(x,datx,daty);
% ---------------Second function f2--------------
f2 =@(x) (1./(1+x.^2));
% data points of f2
datx = -3:1:3;
daty = f2(datx);
x = -3:0.01:3;
% Lagrange interpolant of f2
P2 = Lagrange_poly(x,datx,daty);
%----------------Plot for P1 and P2----------------
% plot of the functions
plot(x,f1(x),x,f2(x));
hold on;
% plot of the two interpolants
plot(x',P1,x',P2);
% plot of the data set
scatter(datx,f1(datx));
scatter(datx,f2(datx));
hold off;
%I seperated f1 and f2 and wrote data every time because daty has conflicted with previous function
%Repeat the experiment with datx1=-3:0.5:3

% ----------------function f1
f1 =@(x) (exp(-x.^2));
% data points of f1
datx1 = -3:0.5:3;
daty = f1(datx1);
% points to interpolate f1
x = -3:0.01:3;
% Lagrange interpolant of f1
P3 = Lagrange_poly(x,datx1,daty);

% -------------------function f2----------
f2 =@(x) (1./(1+x.^2));
% data points of f2
datx1 = -3:0.5:3;
daty = f2(datx1);
% points to interpolate f2
x = -3:0.01:3;
% Lagrange interpolant of f2
P4 = Lagrange_poly(x,datx1,daty);
%------------Plot for P3 and P4
% plot of the functions
plot(x,f1(x),x,f2(x));
hold on;
% plot of the two interpolants
plot(x',P3,x',P4);
% plot of the data set
scatter(datx1,f1(datx1));
scatter(datx1,f2(datx1));
hold off;

%y = Lagrange_poly(x,datx,daty)
function y = Lagrange_poly(x,datx,daty)
    %initialize y
    y = 0;
    %datax that first element is
    firstdatax = size(x,2);
    %datax of first and second elements
    seconddatax = size(datx,2);
    %matrix of full elements
    product = ones(seconddatax,firstdatax);
    %second elements
    for i = 1:seconddatax
        %first element
        for j = 1:seconddatax
            if i ~= j
                product(i,:) = product(i,:).*(x-datx(j))/(datx(i)-datx(j));
            end
        end
       %y = y + daty(i) * product(i,:);
    end
    for i = 1:seconddatax
        y = y + daty(i) * product(i,:);
    end
    %it should be size [601 1]. not [601 1]
    %The ' means transponate. changing from [601 1] to [1 601]
    %y=y';
    y=y';
end