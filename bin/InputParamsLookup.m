function label_string = InputParamsLookup(shorthand_name)
	switch shorthand_name
		case strcmp('oxygen_bubble_rate', shorthand_name)
			label_string = 'Oxygen Bubble Rate (unused)';
		case strcmp('nitrogen_source', shorthand_name)
			label_string = 'Nitrogen Source (unused)';
		case strcmp('nitrogen_ratio', shorthand_name)
			label_string = 'Nitrogen Ratio';
		case strcmp('carbon_source', shorthand_name)
			label_string = 'Carbon Source';
		case strcmp('oxygen_source', shorthand_name)
			label_string = 'Oxygen Source';
		case strcmp('methane_source', shorthand_name)
			label_string = 'Methane Source';
		case strcmp('t_max', shorthand_name)
			label_string = 'Simulation Duration (years)';
		case strcmp('fe_precipitation', shorthand_name)
			label_string = 'Iron Precipitation (probability?)';
		case strcmp('carbon_precipitation', shorthand_name)
			label_string = 'Carbon Precipitation (probability?)';
		case strcmp('diffusion_constant', shorthand_name)
			label_string = 'Diffusion Probability';
		case strcmp('o_fe_rate_const', shorthand_name)
			label_string = 'Fe2+ O2 Redox Rate Constant (M^-1 yr^-1)';
		case strcmp('o_n_rate_const', shorthand_name)
			label_string = 'NH4+ O2 Redox Rate Constant (M^-1 yr^-1)';
		case strcmp('o_s_rate_const', shorthand_name)
			label_string = 'Total Dissolved Sulfide O2 Redox Rate Constant (M^-1 yr^-1)';
		case strcmp('fe_n_rate_const', shorthand_name)
			label_string = 'Fe2+ NO3/NO2 Redox Rate Constant (M^-1 yr^-1)';
		case strcmp('ch4_o_rate_const', shorthand_name)
			label_string = '';
		case strcmp('ch4_s_rate_const', shorthand_name)
			label_string = '';
		case strcmp('primary_ox_rate_const', shorthand_name)
			label_string = '';
		case strcmp('c_lim_o', shorthand_name)
			label_string = '';
		case strcmp('c_lim_n', shorthand_name)
			label_string = '';
		case strcmp('c_lim_fe', shorthand_name)
			label_string = '';
		case strcmp('c_lim_s', shorthand_name)
			label_string = '';
		case strcmp('concs0_c', shorthand_name)
			label_string = '';
		case strcmp('concs0_o', shorthand_name)
			label_string = '';
		case strcmp('concs0_ntot', shorthand_name)
			label_string = '';
		case strcmp('pm_ratio_n', shorthand_name)
			label_string = '';
		case strcmp('concs0_fetot', shorthand_name)
			label_string = '';
		case strcmp('pm_ratio_fe', shorthand_name)
			label_string = '';
		case strcmp('concs0_stot', shorthand_name)
			label_string = '';
		case strcmp('pm_ratio_s', shorthand_name)
			label_string = '';
		otherwise
			label_string = 'dance like a newborn giraffe';
	end
end

