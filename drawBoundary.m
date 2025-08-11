function drawBoundary(a)
CommAreas = readtable(a,'Delimiter',',');

% Create a geographic axes
hold on;
% Plot the boundaries of community areas
for i = 1:height(CommAreas)
    % Extract the geometry for the specified community area
    geom = CommAreas.the_geom{i};
    geom = extractCoordinates(geom);

    % Draw the boundary using geoplot
    geoplot(geom(:,2), geom(:,1), 'r', 'LineWidth', 1.5);
end

% Label each community area
for i = 1:height(CommAreas)
    areaNum = CommAreas.AREA_NUMBE(i);
    [lat, lon] = getCentroid(CommAreas.the_geom{i});
    text(lat, lon, num2str(areaNum), 'Color', 'black', 'FontSize', 10, 'FontWeight', 'bold');
end

% Set title and basemap
title('Community Area Boundaries in Chicago (2023)');
geobasemap streets;
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');
hold off;
end

function coords = extractCoordinates(multipolygon)
% Extract the coordinates from the MULTIPOLYGON string
multipolygon = strrep(multipolygon, 'MULTIPOLYGON (((', '');
multipolygon = strrep(multipolygon, ')))', '');
parts = strsplit(multipolygon, '), (');
coords = [];
for i = 1:length(parts)
    part = strtrim(parts{i});
    part = str2double(strsplit(part, {' ', ','}));
    part = reshape(part, 2, [])';
    coords = [coords; part; NaN NaN]; % Add NaN to separate parts
end
end

function [lat, lon] = getCentroid(multipolygon)
% Calculate the centroid of the community area
coords = extractCoordinates(multipolygon);
coords(any(isnan(coords), 2), :) = []; % Remove NaN separators
lat = mean(coords(:, 2));
lon = mean(coords(:, 1));
end
