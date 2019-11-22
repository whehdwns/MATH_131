f =@(x) (1./(1+x.^2));

datx =[-3:1:3];
x = [-3:0.01:3]';
n = 7; 
cheb_points = cos(pi*[1:2:2*n-1]/(2*n));
daty1 = f(cheb_points);
daty2 = f(datx);

P1= Lagrange_poly(x, datx, daty1);
P2 = Lagrange_poly(x, datx, daty2);

figure;
plot(x, f(x),x,P1,'o',x,P2,'--k','MarkerSize',14,'Linewidth',2);
hold on
scatter(datx,daty2,150,'filled');
hold off

err_cheb = abs(P1 -  f(x));
err_lagrange = abs(P2 - f(x));
figure
plot(1:601, err_cheb,1:601, err_lagrange,'LineWidth',2)

function y = Lagrange_poly(x,datx,daty)
    y = zeros(length(x),1);
    N = length(datx);
    for i = 1:N
        L{i} = ones(length(x),1);
        for j = 1:N
            if i~=j
                L{i} = L{i}.*(x - datx(j))/(datx(i) - datx(j));
            end
        end
    end
    for k = 1: N
        y = y + daty(k)*L{k};
    end
end