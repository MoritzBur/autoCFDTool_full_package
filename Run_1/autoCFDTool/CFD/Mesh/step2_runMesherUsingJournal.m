% step2_runMesherUsingJournal.m
% runs fluent mesher in batch mode using fluentMeshing.jou
% date of creation: 17.09.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('### runMesherUsingJournal started...')


system('fluent 3d -meshing -t4 -hidden -i "fluentMeshing.jou"')

disp('### runMesherUsingJournal finished')