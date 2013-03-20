function [ dSum ] = dailySum( hValues )
%DAILY_SUM Computes daily sum
%   Detailed explanation goes here

    dSum = reshape( hValues, 24, [] );
    dSum = nansum( dSum )';

end

