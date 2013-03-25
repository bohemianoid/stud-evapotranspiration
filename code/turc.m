function [ ET ] = turc( RH, Rs, Tair )
%TURC computes potential evapotranspiration

    % constants
    a = 0.31;       % [m2/MJ mm]
    b = 0.2094;     % [MJ/m]
    
    % conversion
    Rs    = Rs*0.0864;      % [MJ/m2]
    
    % computation
    ET = dTurc( RH, a, Rs, b, Tair );

    % daily Turc equation [mm]
    function [ ET ] = dTurc( RH, a, Rs, b, Tair )
        
        if RH < 50
           
            C = 1+(50-RH)/70;
            
        else
            
            C = 1;
            
        end
       
        ET = a*C.*( Rs+b ).*Tair./( Tair+15 );
        
        ET( ET < 0.1 ) = 0.1;
        
    end

end

