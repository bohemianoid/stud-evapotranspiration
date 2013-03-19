% Author:        Debora Jäckel, Simon Roth, Gabriela Schär, Alexandra Schuler
%                Institute of Environmental Engineering, ETH Zurich
%                Labor II
% Version:       March 2013
% Last revision: 19. March 2013

clear all
close all


% import data
% -------------------------------------------------------------------------

data_folder = 'data/2012/';
lysimeter_folder = 'lysimeter/';
meteo_folder = 'meteo/';
lysimeter_file = '2012_lysimeter_01.txt';
meteo_file = '2012_meteodata_data.txt';

% read data
lysimeter_data = dlmread( [ data_folder lysimeter_folder lysimeter_file ] );
meteo_data = dlmread( [ data_folder meteo_folder meteo_file ], ';', 3, 1 );

clear data_folder lysimeter_folder meteo_folder lysimeter_file meteo_file

% correct time shift
lysimeter_data = [ lysimeter_data; nan( 1, size( lysimeter_data, 2 ) ) ];
meteo_data = [ nan( 1, size( meteo_data, 2 ) ); meteo_data ];

lysimeter_data( size( lysimeter_data, 1 ), 1 ) = lysimeter_data( size( lysimeter_data, 1 )-1, 1 );


% define vectors
% -------------------------------------------------------------------------

% time
time = datenum( num2str( lysimeter_data( :, 1 ) ), 'yyyymmddHH' );
time( size( time ) ) = time( size( time ) )+1/24;

