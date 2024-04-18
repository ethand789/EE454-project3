function [outjpeg] = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
file = dir(dirstring);
jpegs;
file_name;
for i=1:maxframenum
    if (i < 10)
        file_name = ['f000' num2str(i)];
    elseif (i < 100)
        file_name = ['f00' num2str(i)];
    elseif (i < 1000)
        file_name = ['f0' num2str(i)];
    else
        file_name = ['f' num2str(i)];
    end
    jpegs(i) = file.file_name;
end

%convert images to greyscale
for i=0:maxframenum
    Im = imread(jpegs(i));
    Im = double(Im);
    gIm =(Im(:,:,1) + Im(:,:,2) + Im(:,:,3))/3;
    jpegs(i) = gIm;
end

%run motion detection algos


end