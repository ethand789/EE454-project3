function [result] = FrameDiff(jpegs,lamda,size)

result = zeroes(size);

for i=2:size
    diff = abs(jpegs(i-1)-jpegs(i));
    result(i) = imbinarize(diff,lamda);
end


end