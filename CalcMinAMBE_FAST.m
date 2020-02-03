function [ASMBE_val,threshhold] = CalcMinAMBE_FAST(inimage)
    [r,c] = size(inimage);
    
    N = r * c;
    
    frequencies = zeros(1,256);
    
    for i = 1 : r
        for j = 1 : c
            pixel = inimage(i,j) + 1;
            frequencies(pixel) = frequencies(pixel) + 1 ;
        end
    end
    
    
    
        
    SMBE = zeros(1 , 256 ) ;
    ASMBE = zeros(1 , 256 ) ;
    
    SMBE = uint64(SMBE);
    ASMBE = uint64(ASMBE);
    frequencies = uint64(frequencies);
    
    
    expectation = 0;
    
    for i = 1 : 256
        expectation = expectation + (i-1) * frequencies(i);
    end
    
  
    SMBE(1) = (N - frequencies(1)) * 256 - 2 * expectation ;
    
    if SMBE(1) < 0
        ASMBE(1) = -SMBE(1);
    else
        ASMBE(1) = SMBE(1);
    end
    
    for i = 2 : 256
        SMBE(i) = SMBE(i-1) + (N - frequencies(i) * 256);
        if SMBE(i) < 0
            ASMBE(i) = -SMBE(i);
        else
            ASMBE(i) = SMBE(i);
        end
    end
    
    threshhold = 0 ;
    currmin = ASMBE(1) ;
    
    for i = 2 : 256
        if currmin > ASMBE(i)
            currmin = ASMBE(i);
            threshhold = i-1;
        end
    end
    
    
    
    
    ASMBE = uint8(ASMBE);
    ASMBE_val = ASMBE;
   
    
    
end