% runMeshingProcess.m
% this script starts fluent meshing in batch mode using the journal file "fluentMeshing.jou"
% date of creation: 16.09.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('###### runMeshingProcess started...')

run("step1_editMeshParamInJournal.m")
run("step2_runMesherUsingJournal.m")

disp('###### runMeshingProcess finished')