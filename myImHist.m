function [histogram] = myImHist (I , lower , upper)
    
    [row,col] = size(I);
    f = zeros(1,256); 
    
    sumofelements = 0 ;
    
    for i = 1:row
        for j = 1:col
            binno = I(i,j);
            if binno >= lower && binno <= upper
                f(binno+1) = f(binno+1) + 1;
                sumofelements = sumofelements + 1;
            end
        end
    end
    
    if sumofelements == 0 
        sumofelements = 1;
    end
    
    x = 0:255;
    
    
    
    f = f / sumofelements;
    
    histogram(1 , :) = x;
    histogram(2 , :) = f;
    
   
   
    %figure ; 
    %stem(histogram(1,:) , histogram(2,:));
    %grid on;

    %ylabel('Frequency');

    %xlabel('Intensity');
    
end