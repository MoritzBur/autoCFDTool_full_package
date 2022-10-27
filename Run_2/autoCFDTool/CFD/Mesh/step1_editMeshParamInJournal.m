% step1_editMeshParamInJournal.m
% writes desired meshing parameters into fluent journal file
% date of creation: 17.09.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('### editMeshParamInJournal started...')

% include meshing parameter file
load Input\meshingParameters.mat;
load Input\envConfig.mat

% replace placeholders in meshing journal
meshing = fileread('CFD\Mesh\fluentMeshingTemplate.jou');

meshing = strrep(meshing,'GLOBALMIN',num2str(globalMin));
meshing = strrep(meshing,'GLOBALMAX',num2str(globalMax));
meshing = strrep(meshing,'GLOBALGROWTHRATE',num2str(globalGrowthRate));

meshing = strrep(meshing,'FACEMAX',num2str(faceMax));
meshing = strrep(meshing,'WINGLOCALMAX',num2str(wingLocalMax));
meshing = strrep(meshing,'FUSELAGELOCALMIN',num2str(fuselageLocalMin));
meshing = strrep(meshing,'NORMANGLE',num2str(normAngle));
meshing = strrep(meshing,'CELLSPERGAP',num2str(cellsPerGap));

meshing = strrep(meshing,'FIRSTLAYERHEIGHT',num2str(firstLayerHeight));
meshing = strrep(meshing,'NUMBEROFLAYERS',num2str(numberOfLayers));
meshing = strrep(meshing,'LASTPERCENT',num2str(lastPercent));

meshing = strrep(meshing,'XMAX',num2str(xmax));
meshing = strrep(meshing,'YMAX',num2str(ymax));
meshing = strrep(meshing,'ZMAX',num2str(zmax));
meshing = strrep(meshing,'XMIN',num2str(xmin));
meshing = strrep(meshing,'ZMIN',num2str(zmin));

meshing = strrep(meshing,'PARENTPATH',num2str(parentPath));

% save meshing journal
fid = fopen("fluentMeshing.jou",'wt');
fprintf(fid,'%s',meshing);
fclose(fid);

disp('### editMeshParamInJournal finished')