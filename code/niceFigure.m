function [  ] = niceFigure( x1, y1, x2, y2, function1, function2, t, xLabelText, y1LabelText, y2LabelText )
%NICE_FIGURE prints nice figure
    
    figure( length( get( 0, 'Children' ) )+1 )
    [ haxes ] = plotyy( x1, y1, x2, y2, function1, function2 );
    axes( haxes( 1 ) )
    xlim( [ datenum( t( 1 ), 'dd.mm.yyyy' ) datenum( t( 2 ), 'dd.mm.yyyy' ) ] )
    datetick( 'x', 'keeplimits' )
    xlabel( xLabelText )
    ylabel( y1LabelText )
    axes( haxes( 2 ) )
    xlim( [ datenum( t( 1 ), 'dd.mm.yyyy' ) datenum( t( 2 ), 'dd.mm.yyyy' ) ] )
    datetick( 'x', 'keeplimits' )
    xlabel( xLabelText )
    ylabel( y2LabelText )

end