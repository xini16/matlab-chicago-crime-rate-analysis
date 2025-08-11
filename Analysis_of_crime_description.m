Crimes_2023 = readtable('Crimes_2023.csv','Delimiter',',');

% Extract the 'Description' column
descriptions = Crimes_2023.Description;

% Convert descriptions to lower case for consistency
descriptions = lower(descriptions);

% Split descriptions into words
words = regexp(descriptions, '\s+', 'split');
words = [words{:}];

% Remove punctuation and other non-alphabetic characters
words = regexprep(words, '[^a-z]', '');

% Remove empty strings
words = words(~cellfun('isempty', words));

% Count the frequency of each word
uniqueWords = unique(words);
counts = cellfun(@(word) sum(ismember(words, word)), uniqueWords);

% Create the word cloud
figure;
wordcloud(uniqueWords, counts);
title('Crime Descriptions Word Cloud (2023)');
saveas(gcf, 'Crime_description_wordcloud.jpg');
formatSpec = "Created %s";
tNow = datestr(now);
dim = [.13,0,.07,.07];
str = {sprintf(formatSpec, tNow)};
annotation('textbox',dim,'String',str,'FitBoxToText','on');