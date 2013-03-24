function [ mValues ] = monthlySum( Values, Time )
%MONTHLYSUM computes monthly sum

    Time   = month( Time );
    mValues = zeros( max( Time ), 1 );
    
    for i = 1:max( Time )
        
        mValues( i ) = nansum( Values( Time == i ) );
        
    end

end

