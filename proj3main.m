function [outjpeg] = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)
%runs multiple motion detection algorithms on a given set of jpegs stored
%in dirstring according to the other parameters

%read files into cell array, jpegs
file = dir(dirstring);
for i=1:maxframenum
    file_name = [dirstring file(i+2).name];
    tmp= imread(file_name);
    jpegs{i} = tmp;
end


%run motion detection algos

lamda = abs_diff_threshold/255;
BGS = BGSum(jpegs,lamda,maxframenum);
FD = FrameDiff(jpegs,lamda,maxframenum);
ABGS = ABGSum(jpegs,lamda,maxframenum,alpha_parameter);
PFD = PFrameDiff(jpegs,lamda,maxframenum,gamma_parameter);

%return output in case use wants to do further work on ans
for i=1:maxframenum
    outjpeg{i} = [BGS{i}(:,:,1) FD{i}(:,:,1);ABGS{i}(:,:,1) PFD{i}(:,:,1)];

end
%save outputs into file
out_name = ['outputs-' dirstring];
mkdir (out_name);
for i=2:maxframenum
    file_name = sprintf('f%d.jpg',i);
    img_name = fullfile(out_name,file_name);
    imwrite(outjpeg{i},img_name);
end





end