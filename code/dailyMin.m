function [ dValues ] = dailyMin( hValues )
%DAILYMIN computes daily min

    dValues = reshape( hValues, 24, [  ] );
    dValues = min( dValues )';

end

