% runGeometryCreation.m
% writes converted data to CPACS configuration file
% date of creation: 03.06.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('### step3_CPACSeditor started...')

% open default cpacs file
cpacs = fileread('CFD\Geometry\candidateScheme.cpacs.xml');
%cpacs = fileread('simpleCandidateScheme.cpacs.xml');

% replace dummy parameters
% fuselage parameters
cpacs = strrep(cpacs,'CROSSSECTIONTYPE',crossSectionType);
cpacs = strrep(cpacs,'WIDTHFUSELAGE',widthFuselage);
cpacs = strrep(cpacs,'HEIGHTFUSELAGE',heightFuselage);

cpacs = strrep(cpacs,'NOSESECTION2X',noseSection2x);
cpacs = strrep(cpacs,'NOSESECTION3X',noseSection3x);
cpacs = strrep(cpacs,'NOSESECTION4X',noseSection4x);

cpacs = strrep(cpacs,'HULLSECTION1X',hullSection1x);
cpacs = strrep(cpacs,'HULLSECTION2X',hullSection2x);
cpacs = strrep(cpacs,'HULLSECTION3X',hullSection3x);

cpacs = strrep(cpacs,'TAILSECTION1X',tailSection1x);
cpacs = strrep(cpacs,'TAILSECTION2X',tailSection2x);

% wing parameters
cpacs = strrep(cpacs,'LEPOSWING',lePosWing);
cpacs = strrep(cpacs,'VERTICALPOSWING',verticalPosWing);
cpacs = strrep(cpacs,'PROFILEWING',profileWing);
cpacs = strrep(cpacs,'ROOTLENGTHWING',rootLengthWing);
cpacs = strrep(cpacs,'TIPLENGTHWING',tipLengthWing);
cpacs = strrep(cpacs,'TIPSETBACKWING',tipSetBackWing);
cpacs = strrep(cpacs,'ALPHAWINGROOT',alphaWingRoot);
cpacs = strrep(cpacs,'ALPHAWINGMIDSECTION',alphaWingMidSection);
cpacs = strrep(cpacs,'ALPHAWINGTIP',alphaWingTip);
%cpacs = strrep(cpacs,'TWISTWING',twistWing);
cpacs = strrep(cpacs,'SEMISPANWING',semiSpanWing);
cpacs = strrep(cpacs,'KINKPOSWING',kinkPosWing);
cpacs = strrep(cpacs,'SWEEPWING',sweepWing);

% elevator parameters
cpacs = strrep(cpacs,'LEPOSELEVATOR',lePosElevator);
cpacs = strrep(cpacs,'PROFILEELEVATOR',profileElevator);
cpacs = strrep(cpacs,'ROOTLENGTHELEVATOR',rootLengthElevator);
cpacs = strrep(cpacs,'TIPLENGTHELEVATOR',tipLengthElevator);
cpacs = strrep(cpacs,'TIPSETBACKELEVATOR',tipSetBackElevator);
cpacs = strrep(cpacs,'ALPHAELEVATORROOT',alphaElevatorRoot);
cpacs = strrep(cpacs,'ALPHAELEVATORMIDSECTION',alphaElevatorMidSection);
cpacs = strrep(cpacs,'ALPHAELEVATORTIP',alphaElevatorTip);
cpacs = strrep(cpacs,'SEMISPANELEVATOR',semiSpanElevator);
cpacs = strrep(cpacs,'KINKPOSELEVATOR',kinkPosElevator);
cpacs = strrep(cpacs,'SWEEPELEVATOR',sweepElevator);

% rudder parameters
cpacs = strrep(cpacs,'LEPOSRUDDER',lePosRudder);
cpacs = strrep(cpacs,'PROFILERUDDER',profileRudder);
cpacs = strrep(cpacs,'ROOTLENGTHRUDDER',rootLengthRudder);
cpacs = strrep(cpacs,'TIPLENGTHRUDDER',tipLengthRudder);
cpacs = strrep(cpacs,'TIPSETBACKRUDDER',tipSetBackRudder);
cpacs = strrep(cpacs,'SPANRUDDER',spanRudder);
cpacs = strrep(cpacs,'SWEEPRUDDER',sweepRudder);


%save newcpacs to CAD-export ready cpacs file
%fid = fopen("CFD\Geometry\candidate.cpacs.xml",'wt');
fid = fopen("candidate.cpacs.xml",'wt');
fprintf(fid,'%s',cpacs);
fclose(fid);

disp('### step3_CPACSeditor finished')