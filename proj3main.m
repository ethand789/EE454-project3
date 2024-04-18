function [outjpeg] = proj3main(dirstring, maxframenum, abs_diff_threshold, alpha_parameter, gamma_parameter)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
file = dir(dirstring);
jpegs;
for i=1:maxframenum
    file_name = ['f' num2str(i)];
    jpegs(i) = file.file_name;


end