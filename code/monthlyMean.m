function [ mMean ] = monthlyMean( hTime, hValues )
%MONTHLY_MEAN Computes daily mean
%   Detailed explanation goes here

    hTime = month( hTime );
    mMean = zeros( max( hTime ), 1 );
    
    for i = 1:max( hTime )
        
        mMean( i ) = nanmean( hValues( hTime == i ) );
        
    end

end

