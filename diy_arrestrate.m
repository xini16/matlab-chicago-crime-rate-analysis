% Read the CSV file
data = readtable('Crimes_2013_to_2023.csv','Delimiter',',');

% Extract years and arrest status
years = data.Year;
arrests = data.Arrest;

% Get unique years
unique_years = unique(years);

% Initialize an array to hold arrest rates
arrest_rates = zeros(length(unique_years), 1);

% Calculate arrest rate for each year
for i = 1:length(unique_years)
    year = unique_years(i);
    year_indices = (years == year);
    total_crimes = sum(year_indices);
    total_arrests = sum(strcmp(arrests(year_indices), 'true'));
    arrest_rates(i) = total_arrests / total_crimes;
end

% Plot the arrest rate over the years
figure;
plot(unique_years, arrest_rates, '-o', 'LineWidth', 2);
xlabel('Year');
ylabel('Arrest Rate');
title('Arrest Rate in Chicago (2013-2023)');
grid on;

% Save the plot as an image
saveas(gcf, 'ArrestRate_2013_2023.png');
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');
