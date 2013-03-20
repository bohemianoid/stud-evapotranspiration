function [  ] = nice_figure( x, y1, y2, color1, color2, a, b )
%NICE_FIGURE Prints nice figures
%   Detailed explanation goes here
    
    figure( length( get( 0, 'Children' ) )+1 )
    hold on
    stairs( x( ~isnan( y1 ) ), y1( ~isnan( y1 ) ), color1 )
    stairs( x( ~isnan( y2 ) ), y2( ~isnan( y2 ) ), color2 )
    xlim( [ datenum( a, 'dd.mm.yyyy' ) datenum( b, 'dd.mm.yyyy' ) ] )
    ylim( [ 0 max( max( y1 ), max( y2 ) ) ] )
    datetick( 'x', 'keeplimits' )

end

