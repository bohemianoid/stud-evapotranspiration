% Author:        Debora Jäckel, Simon Roth, Gabriela Schär, Alexandra Schuler
%                Institute of Environmental Engineering, ETH Zurich
%                Labor II
% Version:       March 2013
% Last revision: 19. March 2013

clear all
close all


% import data
% -------------------------------------------------------------------------

path             = 'data/2012/';
lysimeter_folder = 'lysimeter/';
lysimeter_file   = '2012_lysimeter_01.txt';
meteo_folder     = 'meteo/';
meteo_file       = '2012_meteodata_data.txt';

lysimeter = dlmread( [ path lysimeter_folder lysimeter_file ] );
meteo     = dlmread( [ path meteo_folder meteo_file ], ';', 3, 1 );