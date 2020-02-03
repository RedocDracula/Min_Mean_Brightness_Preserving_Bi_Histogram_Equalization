function [threshhold , outimage] = BBHE (inimage)
    
    [row,col] = size(inimage);
    sz = size(inimage);
    
    % mean of image , so we can split the image in 2
    mean_value = round( mean(inimage , 'all') );
    
    threshhold = mean_value ;
    
    %first split images into L and U based on mean_value
    
    image_l = zeros(sz);
    image_u = zeros(sz);
    
    
    for i = 1 : row
        for j = 1 : col
            pixel_value = inimage(i,j) ;
            if pixel_value <= mean_value
                image_l(i,j) = inimage(i,j);
            else
                image_u(i,j) = inimage(i,j);
            end
        end
    end
    
    % get the normalized histograms of L and U image respectively
    histogram_l = myImHist(image_l , 0 , mean_value);
    histogram_u = myImHist(image_u , mean_value + 1 , 255);
    
    % apply Histogram equalization on image L and U seperately
    he_image_l = applyhist(histogram_l , image_l , 0 , mean_value);
    he_image_u = applyhist(histogram_u , image_u , mean_value + 1 , 255);
 
    % Final Image is L U R , that is union on both images
    outimage = he_image_l + he_image_u;
    
    outimage = uint8(outimage);
    
    
    
end