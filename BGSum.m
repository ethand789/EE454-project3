function [result] = BGSum(jpegs,lamda,size)

B = jpegs(1);
result = zeroes(size);
for i=2:size
   diff = abs(jpegs(i) - B);
   result(i)= imbinarize(diff,lamda);
end

end