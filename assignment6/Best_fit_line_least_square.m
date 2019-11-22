A = [1 1; 1 3; 1 4 ; 1 5; 1 7]
b = [2;0;-1;3;4]

format rational
 xhat = inv(A'*A)*A'*b

fit = xhat(1) + xhat(2)*A(:,2);
scatter(A(:,2),b,100,'filled')
hold on
plot(A(:,2),fit,'LineWidth',4)
hold off
set(gca,'FontSize',12)
xlabel('x','FontSize',12)
ylabel('y','FontSize',12)
