nmi1 = [0.988,0.965,0.954,0.930,0.854,0.705,0.569,0.216];
nmi2 = [1,1,1,0.99,0.965,0.924,0.833,0.486];
plot(0.1:0.1:0.8,nmi1,'b*--','lineWidth',4, 'MarkerSize',8);
hold all;
plot(0.1:0.1:0.8,nmi2,'r^-','lineWidth',4, 'MarkerSize',8)
hold all
set(gca,'XTick',0.1:0.1:0.8);
set(gca,'XTickLabel',{'0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8'})  

xlabel('\alpha (Noise degree)','fontsize',18)
ylabel('NMI','fontsize',18)
h=legend('SingleView','MultipleView')
set(h,'Fontsize',18);
hold all;

xlim([0.1 0.8]);
ylim([0.1 1.0]);
grid on