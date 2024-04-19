function [result] = ABGSum(jpegs,lamda,size,alpha)


B=jpegs{1};

for i=2:size
    temp = jpegs{i};
   diff = abs(temp - B);
   result{i}= imbinarize(diff,lamda);
   B= alpha*temp + (1-alpha)*B;

end

end