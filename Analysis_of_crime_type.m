Crimes = readtable('Crimes_2013_to_2023.csv','Delimiter',',');

% Group and count the number of occurrences for each primary type
crimeCounts = groupcounts(Crimes, 'PrimaryType');

% Sort the counts in descending order and select the top 10
sortedCrimeCounts = sortrows(crimeCounts, 'GroupCount', 'descend');
top10CrimeCounts = sortedCrimeCounts(1:10, :);

% Sum the counts of the remaining crime types into 'others'
if height(sortedCrimeCounts) > 10
    otherCounts = sum(sortedCrimeCounts.GroupCount(11:end));
    % Create a table row for "Others" with the same structure
    % othersRow = table({'others'}, otherCounts,'VariableNames', {'PrimaryType', 'GroupCount','Percent'});
    % Concatenate the "Others" row with the top 10 counts
    top10CrimeCounts = [top10CrimeCounts; {'others',otherCounts,3}];
end

% Prepare data for pie chart
labels = top10CrimeCounts.PrimaryType;
counts = top10CrimeCounts.GroupCount;

% Create the pie chart
figure;
pie(counts, labels);
title('Distribution of Crime Primary Types (2013-2023)');
saveas(gcf, 'Crime_type_pie.jpg');
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');

