function [AMBE_error , outimage] = HE(inimage)
    histogram = myImHist(inimage , 0 , 255) ;
    outimage = applyhist(histogram , inimage , 0 , 255);
    
    
    normalised_hist = myImHist(outimage , 0 , 255) ;
    
    X = 0 ;
    Y = 0 ;
    
    for i = 1 : 256
        X = X + (i-1) * histogram(2,i);
        Y = Y + (i-1) * normalised_hist(2,i);
    end
    
    AMBE_error = abs(X-Y);
    
end