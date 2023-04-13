function ecdfplot(X)
% Plot Histogram and Ecdf of X
X=sort(X);
[F,x] = ecdf(X);
F=F(2:end); x=x(2:end);
% Compute gcm and lcm points
K=convhull(x',F');
KK=x(K);
KF=F(K);
[~,maxindKK]=max(KK);
% Plot
histogram(X,50,'Normalization','Pdf')
figure,
plot1=plot(x,F,'b-','LineWidth',2);
hold on;
plot2=plot(KK(1:maxindKK),KF(1:maxindKK),'r:*','LineWidth',2);
hold on;
plot3=plot(KK(maxindKK:end),KF(maxindKK:end),'g-.o','LineWidth',2);
hold on;
% plot(KK(1),KF(1),'r*','LineWidth',2);
legend([plot1 plot2 plot3],'ecdf','gcm points','lcm points','Location','northwest'); 
legend('boxoff');
hold off;
end