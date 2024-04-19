function [result] = BGSum(jpegs,lamda,size)

B = jpegs{1};

for i=2:size
    temp = jpegs{i};
   diff = abs(temp - B);
   result{i}= imbinarize(diff,lamda);
end

end