function [ mean_d ] = daily_mean( values_h )
%DAILY_MEAN Computes daily mean
%   Detailed explanation goes here

    mean_d = reshape( values_h, 24, [] );
    mean_d = nanmean( mean_d )';

end

