% Load the crime data for 2023
Crimes_2023 = readtable('Crimes_2023.csv','Delimiter',',');
Crimes_2023 = Crimes_2023(~isnan(Crimes_2023.Latitude) & ~isnan(Crimes_2023.Longitude), :);

% Plot the density of crimes
geodensityplot(Crimes_2023.Latitude, Crimes_2023.Longitude, 'Radius', 5000);
hold on;
% Call drawBoundary to plot the boundaries of community areas
drawBoundary('CommArea_fixed.csv');
geolimits manual;
% Ensure the geographic axes hold is on

% Set title and basemap
title('Crime Location Density and Community Area Boundaries in Chicago (2023)');
geobasemap streets;

% Save the figure
saveas(gcf, 'Crime_location_density.jpg');
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');
