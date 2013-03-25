function [  ] = niceFigure( x, y, legendText, t, titleText )
%NICE_FIGURE Prints nice figure
%   Detailed explanation goes here
    
    figure( length( get( 0, 'Children' ) )+1 )
    hold on
    %stairs( x( ~isnan( y ) ), y( ~isnan( y ) ) )
    stairs( x, y )
    legend( legendText, 'Location', 'BestOutside' )
    xlim( [ datenum( t( 1 ), 'dd.mm.yyyy' ) datenum( t( 2 ), 'dd.mm.yyyy' ) ] )
    ylim( [ 0 max( max( y ) ) ] )
    datetick( 'x', 'mmm', 'keeplimits' )
    ylabel( 'Evapotranspiration [mm]' );
    title( titleText )

end