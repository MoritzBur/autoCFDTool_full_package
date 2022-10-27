# autoCFDTool_full_package

* read geometry parameters
* create volume mesh
* run a CFD analysis
* fully automated!

![grafik](https://user-images.githubusercontent.com/40000888/198261818-41a9b2fb-4a41-4dfe-b4cc-0fa5bf4cf74d.png)



# A few words about this project


autoCDFTool can with minimal user intervention read geometric parameters describing aircraft configurations.
It will automatically build a CAD model, parametrically generate volume meshes for CFD and parametrically solve the flow field using adaptive mesh refinement.
The most important parameters can easily be tweaked to get a better understanding of how this will affect the solution.
The tool is built with Matlab and Ansys fluent, but can also be adapted to use opensource software for example.
Geometry creation is already based on opensource software, using cpacs and tigl developed by the german DLR.

This project was done as part of my undergrad in aeronautical engineering.
The basic idea was to enhance the capabilities of an existing analytic tool for primary sizing of unmanned aireal vehicles.
This existing tool produces a matrixfile of geometric parameters, which is the default way of providing this information.
With very few modifications, this can also be provided by your own parameter file, a cpacs definition or even a step model.

This is just one way of doing it and there is certainly a lot to improve about it. 
I hope that you can use and learn something from what i've done here. And maybe you can even build upon it. :)

# 1.Overview
## 1.1.basic structure studyRunner
The main directory contains 
* multiple Run directories
* studyRunner.m

The script will dive into each Run directory and solve the task that is defined in it.
It is basically just a very simple scheduler to make things easier for you.

## 1.2.basic structure autoCFDTool
This is where stuff is happening. Each instance of "autoCFDTool" contains:
* Input------------(pretty self explanatory)
* CFD--------------(where all the processing happens)
* Output-----------(the data you asked for, as soon as it's available)
* allRun.m---------(script that runs the actual case)
* allClean.m-------(script, that will reset the case )

Inside the "CFD" directory, things are split into:
* Geometry
* Mesh
* Solver
 
## 1.3.the workflow
This section will give a brief overview of how things are connected.
To gain a deeper understanding, just dive into the scripts. I think the comments should be sufficient to understand what is being done.

Matlab is on top of everything, coordinating what is done, and how.

The basic steps are as follows:
### 1.3.1.Geometry creation
* Matlab will read the geometry input file, 
convert data to make it usable in the cpacs definition and
write geometry parameters into cpacs file using the template: candidateScheme.cpacs.xml

* Matlab will trigger a python file to export the cpacs defined model using TiGL
the resulting candidate.step file will be the basis for mesh creation.
The step file can also be created by directly providing the cpacs definition. Or you just copy your step file into the Geometry directory.

### 1.3.2.Meshing
* Matlab will read meshingParameters.m and write the parameters into fluentMeshing.jou using the prepared template.
* fluent meshing will be started with the tasks defined in fluentMeshing.jou
* mesh file will be saved

### 1.3.3.Solver
* Matlab will read solverParameters.m and write the parameters into fluentSolver.jou using the prepared template.
* fluent solution will be started with the tasks defined in fluentSolver.jou
* the case, field data, aerodynamic coefficent data and .pdf/html reports will be saved
* the saved output data will be copied to the Output directory
* All the steps above will be run again until all specified angles of attack are simulated.


# 2.Installation
## 2.1.Matlab
The tool has so far only been tested with Matlab version 2022a.
Alternatively the scripts might also work in GNU Octave, as it is supposed to be matlab compatible.

## 2.2.Python
The tool has been tested with Python version 3.9 and 3.10
If you don't have python installed on your system, install it from the microsoft store for example.
Python must be startable via the command line. To test this, just open a cmd terminal and type in "python".
Depending on your installation it might be necessary to also provide your python version. "python 3.x"
You need to know which command works on your device for one of the following steps.

## 2.3.TiGL
Download DLRs TiGL software. 
The only version tested so far is TiGL 3.2.3.
While installing the software, make sure to tick the box for adding TiGL to the path variable.

This is the toolkit to create cad geometry from cpacs .xml files. There is also a viewer,
so you can quickly check your cpacs definition directly from the .xml file. No need for exports and heavy CAD software.

## 2.4.Anys Fluent
The tool has been tested with Fluent Version 22R2. Student licenses will in principle be able to run the cases, but only at very low resolution.
There is a 512k node limit in place. It might be hard to generate such coarse meshes with sufficient quality.

Before starting fluent from within the workflow, you should start it manually once and deal with all the network popups.
Fluent lso needs to be accessible via the command line. You might need to run the following executable:

[path to your Ansys installation]\v222\fluent\ntbin\win64\setenv.exe

Took me a while to find that file...
Check success by typing "fluent" into a terminal.

## 2.5.envConfig.m
We're close to being done now.
The toolbox needs to know, how it cas start python. If you need or want to specify the version, open envConfig.m and provide the additional "3.x"
in "pythonVersion". If it's just the command "python" for you, skip this step.

# 3.Usage
## 3.1.changing Geometry Definition
If you use the proprietary external input file (myAircraftParameters.m), replace or edit this file.
Note that only rectangular, trapezoidal and a combination thereof are possible as planform shape. If you want elliptic wings, that is for you to implement. 

## 3.2.alternative means of providing Geometry
If you don't use the proprietary tool, you can also disable the conversion steps and directly provide a cpacs file or even step.
Go through the first scripts to see what you don't need.

## 3.3.changing meshing parameters
To change things like local cell sizings, growth rates, boundary layer resolution and so on, open meshingParameters.m and play around with the values.
To understand what they do, it might be helpful to look at Meshing/fluentMeshingTemplate.jou and fluent documentation.
Note, that this will only be the initial mesh. While solving the flow field, the mesh will be refined where it needs to.
The idea is to have only the model surface including boundary layers properly refined. The volume mesh will see adaptive mesh refinement. (more info below)

## 3.4.changing solver parameters
Open solverParameters.m to see and edit parameters for the solver.

### 3.4.1.baseReportName
this will be the name on top of the Reports, followed by the angle of attack.

### 3.4.2.anglesOfAttack
specify each angle of attack that you want to have data on.

### 3.4.3.airSpeed
in m/s. 

### 3.4.4.Iterations
* Iterations-------------------The number of iterations with AMR switched on (refinement will be done every "refineFrequency" iterations)
* IterationsAfterRefine--------The number of iterations after mesh is refined enaugh.

### 3.4.5.AMR parameters
amr* parameters should be self explanatory.
Be careful not to overwhelm your hardware. High refine levels and lower minEdgeLengths will make the cell count grow quickly.
maxCellCount should be used to save your machine from running out of RAM.

Note: default AMR criteria are pressure hessian tensor and turbulent kinetic energy.
Dive into fluent to learn more.

### 3.4.6.reference values
These will be used to calculate coefficients. In default configuration, only referenceLength and referenceArea are needed.

# 4.adapting the tool for your needs
Feel free to make this tool work for you.

## 4.1.adding profiles to cpacs catalog
By default, there are only three profiles inside the cpacs catalogue (at the end of candidateScheme.cpacs.xml).
You can add as many profiles as you want. To help you convert your coordanate data into cpacs usable format, use additionalTools\profileConverter.
It will read common tabulated data and output it the way you see in the cpacs file.

### 4.1.1.Trailing edge treatment
If your profile has a sharp trailing edge, mesh quality will be an issue.
It is recommended to edit z/y coordinates until there is a flat end with a height of ~1% of chord length.
Tip: have working cpacs definition and TiGL Viewer side by side. a change in the .xml file will be visible in TiGL quickly.

I know that this step seems a bit cumbersome. Unfortunately i didn't have the time to get this automated. Maybe you can figure out a way..?

## 4.2.adding meshing parameters
As mesh creation is done entirely by running the journal file, you can edit fluentMeshingTemplate.jou, and add a new PLACEHOLDER.
Go to editMeshParamInJournal.m to add a "find and replace" step for your parameter. Don't forget to define that parameter in the input file.

## 4.3.adding solverparameters
The solution part uses a journal file, just like in the meshing step.
This time however, there is also a template case file "CFD_Basecase", that serves as a starting point.
So you can either statically edit that basecase, or better: you implement everything via TUI commands in the journal file.

Theoretically, the Basecase should not be necessary. In real life however this approach was necessary to work around some fluent bugs.
If you can make things work without using a basecase, that is a big plus.

## 4.4.changing result output
At this point, all post processing operations are defined inside the basecase.
Only report generation and export are triggered from the journal.

## 4.5.ideas for improving this tool
There is a lot to improve here. In case someone is interested, this is a small collection of ideas that i didn't have the time for:

* use "parametric" functionality of fluent, instead of starting the software again and again with different input files for every AoA.
There is also the fluent "Aero" workspace. Maye a future release with bugfixes makes this a viable option.

* GUI for setting up parametric studies or optimizations / including a TiGL-viewer- window. DLRs RCE software might be a good starting point.

* parametrize post processing
as of now, cut planes are placed where they seem to fit according to the default geometry.
Geometry information could be used to parametrically create planes via TUI commands in fluentSover.jou

* volume mesh refinements could be parametrically applied using bodies of influence.
This would provide more control over cell sizes at the wingtips for example.

* adapt this tool to run on opensource software.
GNU Octave might be a drop in replacement for Matlab. 
Changing from fluent to openFoam would be awesome, but probably a bit of work. (especially the AMR part)

* check input files for plausability
This might avoid valuable CPU time wasted on things yu could have seen in advance.

* work out a case that will run on ansys student license with 512k nodes.
