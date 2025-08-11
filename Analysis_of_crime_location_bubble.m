Crimes_2023 = readtable('Crimes_2023.csv','Delimiter',',');

% Clean the data by removing rows with missing latitude and longitude values
Crimes_2023 = Crimes_2023(~isnan(Crimes_2023.Latitude) & ~isnan(Crimes_2023.Longitude), :);

% Group and count the number of occurrences for each district
crimeCounts = groupsummary(Crimes_2023, 'District', 'IncludeEmptyGroups', true);

% Extract the first occurrence of latitude and longitude for each district
[~, firstIdx] = unique(Crimes_2023.District, 'first');
districtLatitudes = Crimes_2023.Latitude(firstIdx);
districtLongitudes = Crimes_2023.Longitude(firstIdx);

% Create a table with district, latitude, longitude, and crime counts
districtData = table(crimeCounts.District, districtLatitudes, districtLongitudes, crimeCounts.GroupCount, ...
    'VariableNames', {'District', 'Latitude', 'Longitude', 'CrimeCount'});

% Convert District to categorical for color mapping
districtData.District = categorical(districtData.District);

% Create the geobubble plot
figure;
geobubble(districtData, 'Latitude', 'Longitude', 'SizeVariable', 'CrimeCount', 'ColorVariable', 'District');
title('Crime Distribution in Chicago Districts (2023)');
geobasemap topographic;

% Save the figure
saveas(gcf, 'Crime_distribution_bubble.jpg');
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');