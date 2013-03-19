function [ aet ] = aet( percip, percol, weight, A, rho_water )
%AET Computes actual evapotranspiration
%   Detailed explanation goes here

    dweight = diff( weight );
    dweight = [ nan( 1, 1 ); dweight ]/rho_water/A*1000;      %[mm]

    aet     = percip-percol-dweight;
    
end

