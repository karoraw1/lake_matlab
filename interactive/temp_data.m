function [datenums, temps] = temp_data()

temp = xlsread('CelsiusVDepth.xlsx');
temps = temp(:,2:end);
dates = {'08/04/12' '08/29/12' '10/02/12' '10/09/12' '11/02/12' '11/12/12' '12/04/12' '1/14/13' '3/27/13' '05/10/13' '6/17/13' '7/17/13' '08/12/13' '10/04/13' '11/12/13'};
datenums = cellfun(@datenum, dates);
density = arrayfun(@waterDensity, temps);

end
