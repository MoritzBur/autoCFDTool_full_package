% runGeometryCreation.m
% this script triggers subcomponents
% date of creation: 03.06.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('###### runGeometryCreation started...')

run("step1_loadParam.m")
run("step2_convertData.m")
run("step3_CPACSeditor.m")
run("step4_exportAircraftCAD.m")

clear;

disp('###### runGeometryCreation finished')