function correctBoundary(a)
common=readtable(a,'Delimiter',',');
[numRows,numCols] = size(a);
initial=common.the_geom;
pure=extractBetween(initial,'(((',')))');
for i=1:numRows
    str=pure{i};
    if isempty(str2num(str))
        left = 1;
        right = length(pure{i}) - 1;
        while left < right
            mid = floor((left + right) / 2);
            if isempty(str2num(str(left:mid)))
                % 错误在左半部分
                right = mid - 1;
            else
                % 左半部分没有错误，继续检查右半部分
                left = mid + 1;
            end
        end
        % 对于有错的数据 从错误点往前找 直到逗号前完整的数据
        if strcmp(str(left),',')~= 1
            left=left-1;
        end
        common.the_geom{i}=['MULTIPOLYGON (((',str(1:left-1),')))'];
    else
        common.the_geom{i}=[common.the_geom;'MULTIPOLYGON (((',str,')))'];
    end
writetable(common,'CommArea_fixed.csv');
end     