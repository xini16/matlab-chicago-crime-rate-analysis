crimedata = readtable('Crimes_2013_to_2023.csv','Delimiter',',');

% Extract year and month from the date column
crimedata.Year = year(crimedata.Date);
crimedata.Month = month(crimedata.Date);
crimedata = sortrows(crimedata,'Year');
crimedata = sortrows(crimedata,'Month');

% Group data by year and month, and count occurrences
groupedData = groupsummary(crimedata,{'Year','Month'},'IncludeEmptyGroups',true);
monthlyCounts = reshape(groupedData.GroupCount,[],12);

% Calculate the average accumulated number of crimes per monthmonthly
Avg = mean(monthlyCounts,1,'omitnan');
accumulatedCrimes = cumsum(Avg);

% Generating line plot
figure;
plot(1:12,accumulatedCrimes,'-o');
xlabel('Month');
ylabel('Accumulated Number of crimes');
title('Average Accumulated crime cases in a Year(2013-2023)');
xticks(1:12);
xticklabels({'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
legend('Accumulated Number of crimes','Location','northwest');
grid on;

saveas(gcf,'Accumulated_crimeNumber_line.jpg');
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');