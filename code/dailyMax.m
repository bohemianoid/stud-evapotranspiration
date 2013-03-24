function [ dValues ] = dailyMax( hValues )
%DAILYMAX computes daily max

    dValues = reshape( hValues, 24, [  ] );
    dValues = max( dValues )';

end

