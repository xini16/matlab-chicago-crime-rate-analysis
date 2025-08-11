Crimes_2024 = readtable('Crimes_2024.csv','Delimiter',',');
Crimes_2023 = readtable('Crimes_2023.csv','Delimiter',',');
Crimes_2024.Month = month(Crimes_2024.Date);
Crimes_2023.Month = month(Crimes_2023.Date);

% Group and count the number of crimes for each month in 2023 and 2024
groupedData_2023 = groupsummary(Crimes_2023, 'Month', 'IncludeEmptyGroups', true);
groupedData_2024 = groupsummary(Crimes_2024, 'Month', 'IncludeEmptyGroups', true);

% Calculate the accumulated number of crimes per month for 2023
accumulatedCrimes_2023 = cumsum(groupedData_2023.GroupCount, 1, 'omitnan');

% Calculate the accumulated number of crimes for the first four months of 2024
accumulatedCrimes_2024 = cumsum(groupedData_2024.GroupCount, 1, 'omitnan');

% Predict the accumulated number of crimes for the next eight months of 2024
for m = 5:12
    accumulatedCrimes_2024(m) = accumulatedCrimes_2024(m-1) + ...
        accumulatedCrimes_2023(m) - accumulatedCrimes_2023(m-1);
end

% Plot the accumulated number of crimes for 2023

figure;
hold on;
plot(1:12, accumulatedCrimes_2023, '-o', 'DisplayName', '2023','LineWidth', 1.5);

% Plot the accumulated number of crimes for 2024
plot(1:4, accumulatedCrimes_2024(1:4), '-x', 'DisplayName', '2024(First 4 months)', 'LineWidth', 1.5);

% Plot the predicted accumulated number of crimes for the next eight months of 2024
plot(5:12, accumulatedCrimes_2024(5:12), '--x', 'DisplayName', '2024(Next 8 months)', 'LineWidth', 1.5);

% Add labels and legend
xticks(1:12);
xticklabels({'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'});
xlabel('Month');
ylabel('Accumulated Number of Crimes');
title('Accumulated Number of Crimes for 2023 and 2024');
legend;

saveas(gcf,'Predicted_accumulated_crimeNumber_line.jpg');
hold off;

formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');