% runGeometryCreation.m
% this script triggers python script "exportCAD.py" to create the STEP file
% date of creation: 03.06.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('### step4_exportCAD started...')

load ..\..\Input\envConfig.mat

command = append("python",pythonVersion," .\exportCAD.py .\candidate.cpacs.xml");
system(command)


disp('### step4_exportCAD finished')