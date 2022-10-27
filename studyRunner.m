% studyRunner.m
% runs all properly defined cases in this file's parent directory
% date of creation: 23.10.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

% To sequentially run multiple cases without triggering execution manually,
% create subfolders like "Run_1, Run_2". Inside those directories, there
% should be the "autoCFDTool"-directory containing your case.
% This script will trigger the allRun.m files, one after the other.
% This way, you can set everything up, start the jobs, and come back to see
% all the results tomorrow. Or next week.

% note that only the parent directory of this script should be on matlab
% path! Subdirectories will be added and removed automatically to avoid
% conflicts 

disp('###### studyRunner started...')

clear;
for i=1:1:99
    pathcommand = append("Run_",num2str(i),"/autoCFDTool");
    addpath(genpath(pathcommand));
   

    clear command;
    command = append("Run_",num2str(i),"/autoCFDTool/allRun.m");
    run(command);
    clear command;

    
end
clear;
disp('###### studyRunner finished...')