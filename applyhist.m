function [outimage] = applyhist(histogram , inimage , low , high)
   
    % This function applies Histogram equalization 
    % low and high is the range of intensities that should be considered ,
    % The histogram input is also in that range , that is the frequency of
    % those intensities out of range is 0.
    
    
    sz = size(inimage);
    outimage = zeros(sz);
    
    
    c = zeros(1, 256);
    c(1) = histogram(2,1);
    
    % calculate CDF , cumulative distribution function by cumulative
    % summing of PDF/ Histogram frequencies
    for i = 2:256
        c(i) = c(i-1) + histogram(2,i);
    end
    
    % appy Transformation , i.e : T(r) = (range of intensities) *
    % CDF(r) 
    
    for i = 1 : sz(1) 
        for j = 1 : sz(2)
            pixel_value = inimage(i,j) + 1;
            outimage(i,j) = round( (high - low) * c ( pixel_value ) ) ;
        end
    end
    
    outimage = uint8(outimage);
    
    
end