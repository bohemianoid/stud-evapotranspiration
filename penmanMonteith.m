function [ pet ] = penmanMonteith( hTime, press, Tair, relHum, windSp )
%PENMANMONTEITH Computes potential evapotranspiration
%   Detailed explanation goes here

    % constants
    z  = 2;
    Lz = 0;
    Lm = 0;

    % psychrometric constant [kPa/°C]        
    psyConst = 0.665*10^-3*press;

    % saturation vapour pressure [kPa]
    satVapPress = 0.6108*exp( 17.27*Tair./( Tair+237.3 ) );

    % actual vapour pressure [kPa]
    actVapPress = relHum.*satVapPress/100;

    % slope of saturation vapour pressure curve [kPa/°C]
    satVapPressSlope = 4098*satVapPress./( Tair+237.3).^2;

    % wind speed on height z [m/s]
    windSpH = windSp*4.87/log( 67.8*z-5.42 );

    % b
    a = year( mean( hTime ) );
    d = datenum( a, 01, 01 );
    J = floor( hTime-d+1 );
        
    bVar = 2*pi*( J-81 )/364;

    % seasonal correction for solar time [h]
    Sc = 0.1645*sin( 2*bVar )-0.1255*cos( bVar )-0.025*sin( bVar );
    
    % solar time angle
    w = pi/12*( ( hTime+0.06667*( Lz-Lm )+Sc )-12 );
    
    % potential evapotranspiration
    pet = w;

end

