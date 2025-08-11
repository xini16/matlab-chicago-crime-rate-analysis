function splitData(a)
crime=readtable(a,'Delimiter',',');
crime13_23=crime(crime.Year <= 2023 & crime.Year >= 2013,:); % seperating out the targeted data respectively
crime23=crime(crime.Year == 2023,:);
crime24=crime(crime.Year == 2024,:);
writetable(crime13_23,'Crimes_2013_to_2023.csv'); % writing the renewed table into three new files
writetable(crime23,'Crimes_2023.csv');
writetable(crime24,'Crimes_2024.csv');
end