function [outjpeg] = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)
%runs multiple motion detection algorithms on a given set of jpegs stored
%in dirstring according to the other parameters

%read files into array jpeg
file = dir(dirstring);
for i=1:maxframenum
    file_name = [dirstring file(i+2).name];
    tmp= imread(file_name);
    jpeg(i) = tmp;
end


%run motion detection algos
BGS = BGSum(jpegs,abs_diff_threshold,maxframenum);
FD = FrameDiff(jpegs,abs_diff_threshold,maxframenum);
ABGS = ABGSum(jpegs,abs_diff_threshold,maxframenum,alpha_parameter);
PFD = PFrameDiff(jpegs,abs_diff_threshold,maxframenum,gamma_parameter);

for i=1:maxframenum
    outjpeg(i) = [BGS(i) FD(i);ABGS(i) PFD(i)];

end




end