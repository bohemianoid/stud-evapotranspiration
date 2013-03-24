function [ mValues ] = monthlyMean( Values, Time )
%MOTHLYMEAN computes monthly mean

    Time   = month( Time );
    mValues = zeros( max( Time ), 1 );
    
    for i = 1:max( Time )
        
        mValues( i ) = nanmean( Values( Time == i ) );
        
    end

end

