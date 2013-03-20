function [ sum_d ] = daily_sum( values_h )
%DAILY_SUM Computes daily sum
%   Detailed explanation goes here

    sum_d = reshape( values_h, 24, [] );
    sum_d = nansum( sum_d )';

end

