% Author:        Debora Jäckel, Simon Roth, Gabriela Schär, Alexandra Schuler
%                Institute of Environmental Engineering, ETH Zurich
%                Labor II
% Version:       March 2013
% Last revision: 19. March 2013

clear all
close all


% import data
% -------------------------------------------------------------------------

data_folder      = 'data/2012/';
lysimeter_folder = 'lysimeter/';
meteo_folder     = 'meteo/';
lysimeter_file   = '2012_lysimeter_01.txt';
meteo_file       = '2012_meteodata_data.txt';

% read data
lysimeter_data = dlmread( [ data_folder lysimeter_folder lysimeter_file ] );
meteo_data     = dlmread( [ data_folder meteo_folder meteo_file ], ';', 3, 1 );

clear data_folder lysimeter_folder meteo_folder lysimeter_file meteo_file

% correct time shift
lysimeter_data( :, 1 )   = datenum( num2str( lysimeter_data( :, 1 ) ), 'yyyymmddHH' );
meteo_data               = [ nan( 1, size( meteo_data, 2 ) ); meteo_data ];
meteo_data               = [ lysimeter_data( :, 1 ), meteo_data( 1:end-1, 2:end ) ];

% define constants
% -------------------------------------------------------------------------

A         = 1;      % [m2]
rho_water = 1000;   % [kg/m3]


% define vectors
% -------------------------------------------------------------------------

% time
time_h = lysimeter_data( :, 1 );        % [h]
time_d = daily_mean( time_h );
time_d = floor( time_d );               % [d]

% weight
weight_h  = lysimeter_data( :, 4 );     % [kg]
weight_d  = daily_mean( weight_h );     % [kg]

% percolation
percol_h = lysimeter_data( :, 5 );      % [mm]
percol_d = daily_sum( percol_h );       % [mm]

% solar radiation
R_s_h = meteo_data( :, 6 );             % [W/m2]
R_s_d = daily_mean( R_s_h );            % [W/m2]

% air temperature
T_air_h = meteo_data( :, 7 );           % [°C]
T_air_d = daily_mean( T_air_h );        % [°C]

% soil temperature
T_soil_h = meteo_data( :, 8 );          % [°C]
T_soil_d = daily_mean( T_soil_h );      % [°C]

% precipitation
percip_h = meteo_data( :, 9 );          % [mm]
percip_d = daily_sum( percip_h );       % [mm]

% relative humidity
relhum_h = meteo_data( :, 10 );         % [%]
relhum_d = daily_mean( relhum_h );      % [%]

clear lysimeter_data meteo_data


% compute evapotranspiration
% -------------------------------------------------------------------------

% actual evapotranspiration
dweight_h = gradient( weight_h )/rho_water/A*1000;      % [mm]
dweight_d = gradient( weight_d )/rho_water/A*1000;      % [mm]
aet_h     = percip_h-percol_h-dweight_h;                % [mm]
aet_d     = percip_d-percol_d-dweight_d;                % [mm]

% figures
nice_figure( time_h, percip_h, aet_h, 'b', 'g', '01.05.2012', '01.06.2012' )
nice_figure( time_d, percip_d, aet_d, 'b', 'g', '01.05.2012', '01.06.2012' )