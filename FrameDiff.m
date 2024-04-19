function [result] = FrameDiff(jpegs,lamda,size)



for i=2:size
    temp1 = jpegs{i-1};
    temp2 = jpegs{i};
    diff = abs(temp1-temp2);
    result{i} = imbinarize(diff,lamda);
end


end