function run_HOOPLA(Switches)
%
% run_HOOPLA(Switches)
%
% Performs calculation according to the user preferences specified in
% launch_HOOPLA.m
%
% Input : Switches: information about specified computation
% Output: Switches: information about specified computation
%
% Programmed by A. Thiboult (2017)

%#ok<*PFBNS> % allow broadcasted array in parfor


% List of tasks to execute
% all combinations of hydro model-catchment-PET-SAR
listTasks=allcomb(find(Switches.isC),find(Switches.isM),find(Switches.isE),find(Switches.isS))';

% Calibration
if Switches.calibration.on == 1
    for iTask=1:size(listTasks,2)
        iC = listTasks(1,iTask);
        iM = listTasks(2,iTask);
        iE = listTasks(3,iTask);
        iS = listTasks(4,iTask);
        ini_calibration(Switches,iC,iM,iE,iS)
    end
    if Switches.calibration.export.on == 1
        export_calibration_results(Switches)
    end
end

% Simulation
if Switches.simulation.on == 1
    for iTask=1:size(listTasks,2)
        iC = listTasks(1,iTask);
        iM = listTasks(2,iTask);
        iE = listTasks(3,iTask);
        iS = listTasks(4,iTask);
        ini_simulation(Switches,iC,iM,iE,iS)
    end
end

% Forecasting
if Switches.forecast.on == 1
    for iTask=1:size(listTasks,2)
        iC = listTasks(1,iTask);
        iM = listTasks(2,iTask);
        iE = listTasks(3,iTask);
        iS = listTasks(4,iTask);
        ini_forecast(Switches,iC,iM,iE,iS)
    end
end