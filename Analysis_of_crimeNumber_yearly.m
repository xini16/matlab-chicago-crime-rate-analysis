initial=readtable('Crimes_2013_to_2023.csv','Delimiter',',');

% grouping the crime cases by years
counts=groupcounts(initial,'Year');
x=counts.Year;
y=counts.GroupCount;

% plotting
figure;
bar(x,y);
title('The number of reported crimes between 2013 and 2023','FontSize',15);
xlabel('Year','FontSize',14);
ylabel('Number of reported crimes','FontSize',14);
yticks(200000:5000:310000); 
ylim([200000 310000]);
set(gca,'FontSize',8);
legend('Number of Crimes','Location','northeast');
grid on;

% saving the figure
saveas(gcf,'Yearly_crimeNumber_bar.jpg');

formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');