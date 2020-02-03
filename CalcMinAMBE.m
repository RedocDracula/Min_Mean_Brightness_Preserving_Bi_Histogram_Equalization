function [AMBE_val,threshhold] = CalcMinAMBE (inimage)
    [r,c] = size(inimage);
    
    N = r * c ;
    
    frequencies = zeros(1,256);
    
    for i = 1 : r
        for j = 1 : c
            pixel = inimage(i,j) + 1;
            frequencies(pixel) = frequencies(pixel) + 1 ;
        end
    end
    
    MBE = zeros(1 , 256 ) ;
    AMBE = zeros(1 , 256 ) ;
    
    expectation = 0;
    
    probabilities = frequencies / N;
    
    for i = 1 : 256
        expectation = expectation + probabilities(i) * (i-1) ;
    end
    
    MBE(1) = 0.5 * ( 256 * ( 1 - probabilities(1))) - expectation ;
    
    if MBE(1) < 0
        AMBE(1) = -MBE(1);
    else
        AMBE(1) = MBE(1);
    end
    
    for i = 2 : 256
        MBE(i) = MBE(i-1) + 0.5 * ( 1 - 256 * probabilities(i));
        if MBE(i) < 0
            AMBE(i) = -MBE(i);
        else
            AMBE(i) = MBE(i);
        end
    end
    
    threshhold = 0 ;
    currmin = AMBE(1) ;
    
    for i = 2 : 256
        if currmin > AMBE(i)
            currmin = AMBE(i);
            threshhold = i-1;
        end
    end
    
    AMBE_val = AMBE;
    
    meanval = mean ( inimage(:));
    disp(meanval);
    
    
end