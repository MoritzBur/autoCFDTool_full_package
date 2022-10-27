% allClean.m
% deletes all files created while running "allRun.m"
% if some steps shall be preserved, define using the clean switches
% date of creation: 17.09.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

% clean switches
cleanGeometry =  1;
cleanMesh =      1;
cleanSolver =    1;
cleanOutput =    1;

if cleanGeometry == 1
    delete CFD\Geometry\candidate.cpacs.xml
    delete CFD\Geometry\candidate.step
    delete CFD\Geometry\flowDomain.scdoc
    delete CFD\Geometry\debug.log
    delete CFD\Geometry\demolog.txt
    delete CFD\Geometry\spaceClaimDomain.py
end

if cleanMesh == 1
    delete CFD\Mesh\debug.log
    delete CFD\Mesh\*.trn
    delete CFD\Mesh\*.bat
    delete CFD\Mesh\CFD_Mesh.cas.msh.h5
    delete CFD\Mesh\fluentMeshing.jou
end

if cleanSolver == 1
    delete CFD\Solver\fluentSolver.jou
    delete CFD\Solver\CFD_Simulation.cas.h5
    delete CFD\Solver\CFD_Simulation.pdat.dat.h5
    delete CFD\Solver\forces.out
    delete CFD\Solver\coefficients.out
    delete CFD\Solver\*.trn
    delete CFD\Solver\*.bat
    delete CFD\Solver\*.asv
    delete CFD\Solver\*.pdf
    delete CFD\Solver\debug.log
    system('rmdir /s /q CFD\Solver\FluentReportServer')
end

if cleanOutput == 1
    system('rmdir /s /q Output')
    system('mkdir Output')
end

delete fluent*
clear
clc
