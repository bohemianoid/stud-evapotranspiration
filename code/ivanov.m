function [ ET ] = ivanov( Tair, RH, cropFactor )
%IVANOV computes potential evapotranspiration

    % daily Ivanov equation [mm]
    ET.d = 0.000036*( 25+Tair.d ).^2.*( 100-RH.d )*cropFactor;
    
    % monthly Ivanov equation [mm]
    ET.m = 0.0011*( 25+Tair.m ).^2.*( 100-RH.m )*cropFactor;

end

