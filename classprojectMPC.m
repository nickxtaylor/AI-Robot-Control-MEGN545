%% Model Predictive Control of a Multi-Input Multi-Output Nonlinear Plant
% This example shows how to design a model predictive controller for a
% multi-input multi-output nonlinear plant defined in Simulink(R) and 
% simulate the closed loop. The plant has three manipulated variables and 
% two measured outputs.

% Copyright 1990-2014 The MathWorks, Inc.

%% Linearize the Nonlinear Plant
% The nonlinear plant is implemented in the Simulink model |mpc_nonlinmodel|. 
% Notice the nonlinearity |0.2*u(1)^3| from the first input to the first output.
open('mpc_nonlinmodel')

%% 
% Linearize the plant at the default operating conditions (the initial 
% states of the transfer function blocks are all zero) using the 
% |linearize| command from Simulink(R) Control Design(TM).
plant = linearize('mpc_nonlinmodel');

%%
% Assign names to I/O variables.
plant.InputName = {'Mass Flow';'Heat Flow';'Pressure'};  
plant.OutputName = {'Temperature';'Level'};
plant.InputUnit = {'kg/s' 'J/s' 'Pa'};
plant.OutputUnit = {'K' 'm'};

%%
% Note that since you have not defined any measured or unmeasured disturbance, 
% or any an unmeasured output, when an MPC controller is created based on 
% |plant|, by default all plant inputs are assumed to be manipulated variables 
% and all plant outputs are assumed to be measured outputs.

%% Design the MPC Controller
% Create the controller object with sampling period, prediction and control
% horizons of 0.2 sec, 5 steps, and 2 moves, respectively;
mpcobj = mpc(plant,0.2,5,2);

%%
% Specify hard constraints on the manipulated variable.
mpcobj.MV = struct('Min',{-3;-2;-2},'Max',{3;2;2},'RateMin',{-1000;-1000;-1000});

%%
% Define weights on manipulated variables and output signals.
mpcobj.Weights = struct('MV',[0 0 0],'MVRate',[.1 .1 .1],'OV',[1 1]);

%%
% Display the MPC object to review its properties.
mpcobj

%% Simulate the Closed Loop Using Simulink
% Open the pre-existing Simulink model for the closed-loop simulation.
% The plant model is identical to the one used for linearization, while
% the MPC controller is implemented with an MPC controller block, which
% has the workspace MPC object |mpcobj| as parameter.
% The reference for the first output is a step signal rising from zero to
% one for t=0, as soon as the simulation starts. The reference for the 
% second output 
mdl1 = 'mpc_nonlinear';
open_system(mdl1)