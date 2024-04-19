function [result] = PFrameDiff(jpegs,lamda,size,gamma)

result = zeroes(size);
H=0;

for i=2:size
    diff = abs(jpegs(i-1)-jpegs(i));
    result(i) = imbinarize(diff,lamda);
    tmp = max(H-gamma,0);
    H=max(255*result(i),tmp);
    result(i)=H;
end

end