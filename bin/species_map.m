%% Species Map Function
% This subfunction of the mystic lake model creates a hash table to map the 
% names of chemical species and their position in reaction matrices. The 
% keys are strings containing the names and the values are integers.

function species_hash = species_map()

	species = {'O', 'C', 'N+', 'N-', 'S+', 'S-', 'Fe+', 'Fe-', 'CH4', 'null'};
	species_hash = containers.Map(species, 1:length(species));

end
