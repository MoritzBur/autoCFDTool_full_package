% runSolver.m
% this script starts fluent meshing in batch mode using the journal file "fluentSolver.jou"
% date of creation: 28.09.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('###### runSolver started...')

% run simulations for all specified AoAs in "anglesOfAttack" in
% solverparameters.mat
load Input\solverParameters.mat;
nAnglesOfAttack = size(anglesOfAttack);
nAnglesOfAttack = nAnglesOfAttack(1,2);
for i = 1:nAnglesOfAttack
    currentAngleOfAttack = anglesOfAttack(1,i);
    reportName = append(baseReportName,"_at_",num2str(currentAngleOfAttack),"deg");
    run("step1_editSolutionParamInJournal.m");
    run("step2_runSolverUsingJournal.m");
    system(['mkdir ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg']);
    %system(['mkdir M:\Studium\Projektarbeit\Projektarbeit_CFD\autoCFDTool\Output\AoA_' num2str(currentAngleOfAttack) 'deg']);
    system(['MOVE CFD_Simulation.cas.h5 ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg'])
    system(['MOVE CFD_Simulation.pdat.dat.h5 ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg'])
    system(['MOVE forces.out ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg'])
    system(['MOVE coefficients.out ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg'])
    system(['MOVE fluentSolver.jou ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg'])
    system(['MOVE *.trn ..\..\Output\AoA_' num2str(currentAngleOfAttack) 'deg'])
    %generate scalar string for next system command. (system requires text scalar)
    %command = "MOVE M:\Studium\Projektarbeit\Projektarbeit_CFD\autoCFDTool\CFD\Solver\";
   
    command = append("MOVE ",reportName,".pdf ..\..\Output\AoA_",num2str(currentAngleOfAttack),"deg");
    system(command);
    clear command;
    
          command = append("MOVE ",reportName,"_html_Report ..\..\Output\AoA_",num2str(currentAngleOfAttack),"deg");
    system(command);
    clear command;


    
end



disp('###### runSolver finished')