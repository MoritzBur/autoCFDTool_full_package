% runGeometryCreation.m
% converts configuration input data to parameters usable in CPACS
% date of creation: 03.06.2022
% developer:Moritz Burmester
% contact:moritz@burmester-iz.de

disp('### step2_convertData started...')

% extract usable parameter data

% fuselage parameters
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%

% crossSectionType
if contains(param{37,4},'Rechteck')
    crossSectionType = "squareProfile";
else 
    crossSectionType = "circleProfile";
end

% widthFuselage
widthFuselage = num2str(param{54,4}*1/1000); % scale with respect to profile base definition in cpacs file

% heightFuselage
heightFuselage = num2str(param{184,4}*1/1000); % scale with respect to profile base definition in cpacs file

% lengthNose
% noseSection1x is always = 0
noseSection2x = num2str(param{216,4}*0.125);
noseSection3x = num2str(param{216,4}*0.45);
noseSection4x = num2str(param{216,4}); % this will create a smooth ellipsoid type nose with the section scaling as defines in cpacs file

% lengthMidSection
hullSection1x = num2str(param{216,4}+param{219,4}*0.925);
hullSection2x = num2str(param{216,4}+param{219,4});
hullSection3x = num2str(param{216,4}+param{219,4}*1.075);

% lenghtTail
tailSection1x = num2str(param{216,4}+param{219,4}+param{212,4}*0.53);
tailSection2x = num2str(param{216,4}+param{219,4}+param{212,4});

% main wing paramaters
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
% lePosWing
lePosWing = num2str(param{163,4}+param{216,4}-param{224,4}*0.25);

% planformWing
% special treatment for different planform options necessary!

% verticalPosWing
verticalPosWing = num2str(((-param{184,4}/2+(param{162,4}-1)*param{184,4}/2))*7*0.0001);

% profileWing
profileWing = convertCharsToStrings(param{377,4});

% rootLengthWing
rootLengthWing = num2str(param{224,4});

% tipLengthWing
tipLengthWing = num2str(param{224,4}*param{259,4});

% tipSetBackWing (correct x Position of tip section to get straight 25% line)
tipSetBackWing = num2str((param{224,4}-param{224,4}*param{259,4})*0.25);

% alphaWingRoot
alphaWingRoot = num2str(param{27,4});

% alphaWingMidSection
alphaWingMidSection = num2str(param{27,4}+param{47,4}*param{449,4});

% alphaWingTip
alphaWingTip = num2str(param{27,4}+param{449,4});

% twistWing
%twistWing = num2str(param{449,4});

% semiSpanWing
semiSpanWing = num2str(param{45,4}/2);

% kinkPosWing
kinkPosWing = num2str(param{47,4}*param{45,4}/2);

% sweepWing
sweepWing = num2str(param{370,4});



% elevator paramaters
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
% lePosElevator
lePosElevator = num2str(param{201,4}+param{216,4}-param{225,4}*0.25);

% planformElevator
% special treatment for different planform options necessary!

% profileElevator
profileElevator = convertCharsToStrings(param{378,4});

% rootLengthElevator
rootLengthElevator = num2str(param{225,4});

% tipLengthElevator
if param{182,4}==0  % rectangular planform
    tipLengthElevator = num2str(param{225,4});

elseif param{182,4}==1 % trapezoidal planform
    tipLengthElevator = num2str(param{225,4}*param{261,4});

elseif param{182,4}==2 % rectangle + trapezoidal planform
    tipLengthElevator = num2str(param{225,4}*param{261,4});
end

% tipSetBackElevator
tipSetBackElevator = num2str((str2double(rootLengthElevator)-str2double(tipLengthElevator))*0.25);


% alphaElevator
alphaElevatorRoot = num2str(param{28,4});

% alphaElevatorMidSection
if param{182,4}==0
    alphaElevatorMidSection = num2str(param{28,4});

elseif param{182,4}==1
    alphaElevatorMidSection = num2str(param{28,4});

elseif param{182,4}==2
    alphaElevatorMidSection = num2str(param{28,4}+param{450,4}*param{48,4});
end


% alphaElevatorTip
alphaElevatorTip = num2str(param{28,4}+param{450,4});

% twistElevator

% semiSpanElevator
semiSpanElevator = num2str(param{58,4}/2);

% kinkPosElevator
if param{182,4}==0
    kinkPosElevator = num2str(0.01);

elseif param{182,4}==1
    kinkPosElevator = num2str(0.01);

elseif param{182,4}==2
    kinkPosElevator = num2str(param{48,4}*param{58,4}/2);
end

% sweepElevator
sweepElevator = num2str(param{371,4});



% rudder paramaters
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%
% lePosRudder
lePosRudder = num2str((param{201,4}+param{216,4}-param{225,4}*0.25)-(2*param{442,4}/(param{61,4}*(1+param{263,4}))-param{225,4}));

% planformRudder
% special treatment for different planform options necessary!

% profileRudder
profileRudder = convertCharsToStrings(param{379,4});

% rootLengthRudder
rootLengthRudder = num2str(2*param{442,4}/(param{61,4}*(1+param{263,4})));

% tipLengthRudder
tipLengthRudder = num2str((2*param{442,4}/(param{61,4}*(1+param{263,4})))*param{263,4});

% tipSetBackRudder (correct x Position of tip section to get straight 25% line)
tipSetBackRudder = num2str((str2double(rootLengthRudder)-str2double(tipLengthRudder))*0.25);

% spanRudder
spanRudder = num2str(param{61,4});

% sweepRudder
sweepRudder = num2str(param{372,4});

disp('### step2_convertData finished')