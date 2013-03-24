function [ mValues ] = dailySum( hValues )
%DAILYSUM computes daily sum

    mValues = reshape( hValues, 24, [  ] );
    mValues = nansum( mValues )';

end

