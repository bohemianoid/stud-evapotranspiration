%% Measuring and Modelling Evapotranspiration
% Authors:       Debora Jäckel, Simon Roth, Gabriela Schär, Alexandra Schuler //
%                Institute of Environmental Engineering, ETH Zurich //
%                Labor II //
% Version:       March 2013 //
% Last revision: 20. March 2013


%% Reset workspace

clear all
close all


%% Import data

lysimeter.folder = 'data/2012/lysimeter/';
lysimeter.file   = '2012_lysimeter_01.txt';
meteo.folder     = 'data/2012/meteo/';
meteo.file       = '2012_meteodata_data.txt';

% read data
lysimeter.data = dlmread( [ lysimeter.folder lysimeter.file ] );
meteo.data     = dlmread( [ meteo.folder meteo.file ], ';', 3, 1 );

% correct time shift
lysimeter.data( :, 1 ) = datenum( num2str( lysimeter.data( :, 1 ) ), 'yyyymmddHH' );
meteo.data             = [ nan( 1, size( meteo.data, 2 ) ); meteo.data ];
meteo.data             = [ lysimeter.data( :, 1 ), meteo.data( 1:end-1, 2:end ) ];


%% Define constants

t = { '01.01.2012', '31.12.2012' };     % [dd.mm.yyyy]


%% Define vectors

% time
time.h = lysimeter.data( :, 1 );                    % [h]
time.d = floor( dailyMean( time.h ) );              % [d]
time.m = floor( monthlyMean( time.h, time.h ) );    % [m]

% storage
storage.h = gradient( lysimeter.data( :, 4 ) );     % [mm]
storage.d = dailySum( storage.h );                  % [mm]
storage.m = monthlySum( time.h, storage.h );        % [mm]

% percolation
percol.h = lysimeter.data( :, 5 );                  % [mm]
percol.d = dailySum( percol.h );                    % [mm]
percol.m = monthlySum( time.h, percol.h );          % [mm]

% solar radiation
Rs.h = meteo.data( :, 5 );                          % [W/m2]
Rs.d = dailyMean( Rs.h );                           % [W/m2]
Rs.m = monthlyMean( time.h, Rs.h );                 % [W/m2]

% pressure
press.h = meteo.data( :, 6 )/10;                    % [kPa]
press.d = dailyMean( press.h );                     % [kPa]
press.m = monthlyMean( time.h, press.h );           % [kPa]

% air temperature
Tair.h = meteo.data( :, 7 );                        % [°C]
Tair.d = dailyMean( Tair.h );                       % [°C]
Tair.m = monthlyMean( time.h, Tair.h );             % [°C]

% soil temperature
Tsoil.h = meteo.data( :, 8 );                       % [°C]
Tsoil.d = dailyMean( Tsoil.h );                     % [°C]
Tsoil.m = monthlyMean( time.h, Tsoil.h );           % [°C]

% precipitation
percip.h = meteo.data( :, 9 );                      % [mm]
percip.d = dailySum( percip.h );                    % [mm]
percip.m = monthlySum( time.h, percip.h );          % [mm]

% relative humidity
relHum.h = meteo.data( :, 10 );                     % [%]
relHum.d = dailyMean( relHum.h );                   % [%]
relHum.m = monthlyMean( time.h, relHum.h );         % [%]

% wind speed
windSp.h = meteo.data( :, 12 );                     % [m/s]
windSp.d = dailyMean( windSp.h );                   % [m/s]
windSp.m = monthlyMean( time.h, windSp.h );         % [m/s]

clear lysimeter meteo


%% Compute evapotranspiration

% actual evapotranspiration
aet.h = percip.h-percol.h-storage.h;    % [mm]
aet.d = percip.d-percol.d-storage.d;    % [mm]
aet.m = percip.m-percol.m-storage.m;    % [mm]

% penman-monteith
penmanMonteith( time.h, press.h, Tair.h, relHum.h, windSp.h );


%% Figures
niceFigure( time.h, percip.h, aet.h, 'b', 'g', t, 'Houarly Actual Evapotranspiration' )
niceFigure( time.d, percip.d, aet.d, 'b', 'g', t, 'Daily Actual Evapotranspiration' )
niceFigure( time.m, percip.m, aet.m, 'b', 'g', t, 'Monthly Actual Evapotranspiration' )