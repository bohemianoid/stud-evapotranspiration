function [ dMean ] = dailyMean( hValues )
%DAILY_MEAN Computes daily mean
%   Detailed explanation goes here

    dMean = reshape( hValues, 24, [] );
    dMean = nanmean( dMean )';

end