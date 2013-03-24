function [ e0 ] = satVapPressure( Tair )
%SATVAPPRESSURE computes saturation vapour pressure [kPa]

    e0 = 0.6108*exp( 17.27*Tair./( Tair+237.3 ) );

end

