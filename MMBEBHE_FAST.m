function [threshhold , error , outimage] = MMBEBHE_FAST (inimage)
    [row,col] = size(inimage);
    sz = size(inimage);
    
    [AMBE_val , threshhold ] = CalcMinAMBE(inimage);
   
    error = AMBE_val (threshhold + 1); 
    
    %first split images into L and U based on threshhold value which has
    %minimum Absolute Mean Brightness Error 
    
    image_l = zeros(sz);
    image_u = zeros(sz);
    
    threshhold = uint8(round(threshhold));
    
    for i = 1 : row
        for j = 1 : col
            pixel_value = inimage(i,j) ;
            if pixel_value <= threshhold
                image_l(i,j) = inimage(i,j);
            else
                image_u(i,j) = inimage(i,j);
            end
        end
    end
    
    % get the normalized histograms of L and U image respectively
    histogram_l = myImHist(image_l , 0 , threshhold);
    histogram_u = myImHist(image_u , threshhold + 1 , 255);
    
    % apply Histogram equalization on image L and U seperately
    he_image_l = applyhist(histogram_l , image_l , 0 , threshhold);
    he_image_u = applyhist(histogram_u , image_u , threshhold + 1 , 255);
 
    % Final Image is L U R , that is union on both images
    outimage = he_image_l + he_image_u;
    
    outimage = uint8(outimage);
    
end