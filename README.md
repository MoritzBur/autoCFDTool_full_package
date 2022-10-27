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

# Overview
## basic structure studyRunner
The main directory contains 
* multiple Run directories
* studyRunner.m

The script will dive into each Run directory and solve the task that is defined in it.
It is basically just a very simple scheduler to make things easier for you.

## basic structure autoCFDTool
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
 
## the workflow
This section will give a brief overview of how things are connected.
To gain a deeper undeerstanding, just dive into the scripts. I think the comments should be sufficient to understand what is being done.

Matlab is on top of everything, coordinating what is done, and how.
...let me rest.



# Installation
## Matlab
## Python
## TiGL
## Anys Fluent
## envConfig.m

# Usage
## changing Geometry Definition
## alternative means of providing Geometry
## changing meshing parameters
## changing solver parameters

# adapting the tool for your needs
## adding profiles to cpacs catalog
## adding meshing parameters
## adding solverparameters
## changing result output
## ideas for improving this tool
