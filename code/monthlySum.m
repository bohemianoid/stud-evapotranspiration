function [ mSum ] = monthlySum( hTime, hValues )
%MONTHLY_SUM Computes monthly sum
%   Detailed explanation goes here

    hTime = month( hTime );
    mSum = zeros( max( hTime ), 1 );
    
    for i = 1:max( hTime )
        
        mSum( i ) = nansum( hValues( hTime == i ) );
        
    end

end

