function [result] = PFrameDiff(jpegs,lamda,size,gamma)


H=0;

for i=2:size
    temp1 = jpegs{i-1};
    temp2 = jpegs{i}
    diff = abs(temp1-temp2);
    result{i} = imbinarize(diff,lamda);
    tmp = max(H-gamma,0);
    H=max(255*result{i},tmp);
    result{i}=H;
end

end