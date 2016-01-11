%%Mystic Model Main script
%This is the main script from which the Mysic Lake model is run.
%This guide will take you step by step through the code.

%%Setup scripting environment

%This section checks the current working folder. If not set to 'mystic', model exits.
current_folder = cd;

if strcmp(current_folder(end-5:end),'mystic') == 0;
    error('Please set current folder to /mystic ');
    return;
end;

%This section ensures all the locations of model scripts and variables are accesible from this script
addpath('./observedvalues');
addpath('./bin');
addpath('./simulation');
addpath('./');

%This section accesses and prints model parameter values stored in 'simulation_parameters.txt'.
%Unless modified, the default values are used.

if exist('simulation_parameters.txt', 'file') ~= 2;
    error('Simulation parameter file not detected');
    return;
end;

% The particular format of the text file is "variable_name = value" with required spaces on either side of the '=' sign.

fileID = fopen('simulation_parameters.txt','r');
inputs = textscan(fileID, '%s %*s %f');
fclose(fileID);
input_nums = inputs{2};

% A loop is used to print the default values picked up by the `textscan` function for the users perusal.
% Printing can be suppressed by changing the value of the 'show_inputs' variable in the script to 0.
% A subfunction will be implemented in future versions to convert the variable names in the future.

show_inputs = 1;
if show_inputs;
    disp('Input Parameters');
    disp('');
    for i=1:length(input_nums);
        print_line = [inputs{1}{i}, ' = ', num2str(input_nums(i))];
        disp(print_line);
    end;
end;

% A hash table is created to map the input values to input names. This object will be passed to lake.m

input_names = inputs{1};
input_hash = containers.Map(input_names, input_nums);

% Another hash table for lake.m is created to link names with their position in reaction matrices.

species_hash = species_map();

%gets temperature data from helper function 
[dates, temps] = temp_data();

%run model

[time_slices, concs_history, rates_history] = lake(input_hash, species_hash);

if save_data
    write_data_to_files
end

%show_concs = 1; % show the concentrations?
%show_c = 1; % show the carbon species?
%show_rates = 1; % show the rates data?
%save_data = 1;  % save the time, rate, and concs data?
%show_time = 100;
%figure;



if show_concs
    subplot(1,2,1);
    % prepare lists of the curves to be drawn
    if show_c
        to_show = {'O', 'N+', 'N-', 'S+', 'S-', 'Fe+', 'Fe-', 'CH4'};
        i_bold_max = 2;
    else
        to_show = {'O', 'N+', 'N-', 'S+', 'S-', 'Fe+', 'Fe-'};
        i_bold_max = 1;
    end
    idx = cellfun(@(x) s(x), to_show);

    % clear the plot
    %clf;

    % show the final concentration curves
    % plot all the curves on one graph, bolding one line
    hold all;
    for i = idx
        if i <= i_bold_max
            plot(concs_history(show_time, :, i), 'LineWidth', 2)
        else
            plot(concs_history(show_time, :, i))
        end
    end
    hold off;

    % attach labels
    xlabel('depth');
    ylabel('concentration');

    % attach legend
    if show_c
        legend('O', 'N+', 'N-', 'S+', 'S-', 'Fe+', 'Fe-', 'CH4');
    else
        legend('O', 'N+', 'N-', 'S+', 'S-', 'Fe+', 'Fe-');
    end
end

if show_rates
    subplot(1,2,2);
    idx = [7 8 9 10 6 5];

    %clf;
    hold all;
    for i = idx
        plot(rates_history(show_time, :, i));
    end
    hold off;

    % attach labels
    xlabel('depth');
    ylabel('rate');

    legend('aer het', 'nit red', 'iron red', 'sulf red', 'metht sulf', 'metht oxy');
end