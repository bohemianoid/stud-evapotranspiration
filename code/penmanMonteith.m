function [ ET ] = penmanMonteith( es, Tair, RH, alpha, Rs, time, latitude, Gsc, hGeo, sigma, Tmax, Tmin, press, uz, z )
%PENMANMONTEITH Computes potential evapotranspiration

    % conversion
    Rs    = Rs*0.0864;      % [MJ/m2]
    press = press/10;       % [kPa]
    
    % computation
    Delta = sloSatVapPreCur( es, Tair );
    ea    = actVapPre( RH, es );
    Rn    = netRad( alpha, Rs, time, latitude, Gsc, hGeo, sigma, Tmax, Tmin, ea );
    G     = soiHeaFlu(  );
    gamma = psyCon( press );
    u2    = winProRel( uz, z );
    ET    = PenmanMonteith( Delta, Rn, G, gamma, Tair, u2, es, ea );

    % slope of saturation vapour pressure curve [kPa/°C]
    function [ Delta ] = sloSatVapPreCur( es, Tair )
        
        Delta = 4098*es./( Tair+237.3 ).^2;
        
    end

    % actual vapour pressure [kPa]
    function [ ea ] = actVapPre( RH, es )
        
        ea = RH/100.*es;
        
    end

    % net radiation [MJ/m2]
    function [ Rn ] = netRad( alpha, Rs, time, latitude, Gsc, hGeo, sigma, Tmax, Tmin, ea )
        
        % net shortwave radiation
        Rns    = ( 1-alpha )*Rs;
        
        % net longwave radiation
        J      = time-datenum( 01, 01, year( time ) )+1;
        dr     = 1+0.033*cos( 2*pi/365*J );
        phi    = pi/180*latitude;
        rho    = 0.409*sin( 2*pi/365*J-1.39 );
        omegas = acos( -tan( phi )*tan( rho ) );
        Ra     = 24*60/pi*Gsc*dr.*( omegas*sin( phi ).*sin( rho )+cos( phi ).*cos( rho ).*sin( omegas ) );
        Rso    = ( 0.75+2*10^-5*hGeo )*Ra;
        Rnl    = sigma*( Tmax.^4+Tmin.^4 )/2.*( 0.34-0.14*sqrt( ea ) ).*( 1.35*Rs./Rso-0.35 );
        
        Rn     = Rns-Rnl;
        
    end

    % soil heat flux [MJ/m2]
    function [ G ] = soiHeaFlu(  )
        
        G = 0;
        
    end

    % psychrometric constant [kPa/°C]
    function [ gamma ] = psyCon( press )
        
        gamma = 0.665*10^-3*press;
        
    end

    % wind profile relationship
    function [ u2 ] = winProRel( uz, z )
        
        u2 = uz*4.87/log( 67.8*z-5.42 );
        
    end
    
    % daily FAO Penman-Monteith equation [mm]
    function [ ET ] = PenmanMonteith( Delta, Rn, G, gamma, Tair, u2, es, ea )
       
        ET = ( 0.408*Delta.*( Rn-G )+gamma*900./( Tair+273 ).*u2.*( es-ea ) )./( Delta+gamma.*( 1+0.34*u2 ) );
        
    end

end