function [result] = ABGSum(jpegs,lamda,size,alpha)

result = zeroes(size);
B=jpegs(1);

for i=2:size
   diff = abs(jpegs(i) - B);
   result(i)= imbinarize(diff,lamda);
   B= alpha*jpegs(i) + (1-alpha)*B;

end

end