% step1_loadParam.m
% opens aircraft configuration file as variable "param"
% date of creation: 03.06.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('### step1_loadParam started...')

%Path for input file has to be set or automated in some way!

input = load('..\..\Input\myAircraftParameters.mat'); %load input file as variable
%input = load('..\..\Input\Flugzeug_9330466532.mat'); %load input file as variable

cell = struct2cell(input);          %convert struct to cell array (1x1)
param = cell{1};                      %extract matrix from cell
%param = mat(:,4);                   %extract parameter vector from matrix

clear cell, clear input  %delete temporary data

disp('### step1_loadParam finished')