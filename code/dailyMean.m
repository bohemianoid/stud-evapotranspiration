function [ dValues ] = dailyMean( hValues )
%DAILYMEAN computs daily mean

    dValues = reshape( hValues, 24, [  ] );
    dValues = nanmean( dValues )';

end

