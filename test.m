I = imread('car.png');

if size(I,3) == 3
    I = rgb2gray(I);
end

[AMBE_array,~] = CalcMinAMBE (I) ;
[he_error , HE_Image] = HE(I);

[Tm , bbhe] = BBHE(I);
bbhe_error = AMBE_array(Tm+1);
[Tk , mmbebhe_error , mmbebhe] = MMBEBHE(I);


figure ;
subplot(2,2,1);
imshow(I);
title(' Original image ');

subplot(2,2,2);
imshow(HE_Image);
title([{' after HE , AMBE : ', num2str(he_error)} ]);

subplot(2,2,3);
imshow(bbhe);
title([{' after BBHE ',' AMBE : ' num2str(bbhe_error ) ,'Tm = ' num2str(Tm)}]);

subplot(2,2,4);
imshow(mmbebhe);
title([{' after MMBEBHE ' ,' AMBE : ' num2str(mmbebhe_error) ,'Tk = ' num2str(Tk) }] );

%%%%%%%%%%%%%%%%%%%%%%%

I = imread('hist.jpg');

if size(I,3) == 3
    I = rgb2gray(I);
end

[AMBE_array,~] = CalcMinAMBE (I) ;
[he_error , HE_Image] = HE(I);

[Tm , bbhe] = BBHE(I);
bbhe_error = AMBE_array(Tm+1);
[Tk , mmbebhe_error , mmbebhe] = MMBEBHE(I);


figure ;
subplot(2,2,1);
imshow(I);
title(' Original image ');

subplot(2,2,2);
imshow(HE_Image);
title([{' after HE , AMBE : ', num2str(he_error)} ]);

subplot(2,2,3);
imshow(bbhe);
title([{' after BBHE ',' AMBE : ' num2str(bbhe_error ) ,'Tm = ' num2str(Tm)}]);

subplot(2,2,4);
imshow(mmbebhe);
title([{' after MMBEBHE ' ,' AMBE : ' num2str(mmbebhe_error) ,'Tk = ' num2str(Tk) }] );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I = imread('butterfly.png');

if size(I,3) == 3
    I = rgb2gray(I);
end

[AMBE_array,~] = CalcMinAMBE (I) ;
[he_error , HE_Image] = HE(I);

[Tm , bbhe] = BBHE(I);
bbhe_error = AMBE_array(Tm+1);
[Tk , mmbebhe_error , mmbebhe] = MMBEBHE(I);


figure ;
subplot(2,2,1);
imshow(I);
title(' Original image ');

subplot(2,2,2);
imshow(HE_Image);
title([{' after HE , AMBE : ', num2str(he_error)} ]);

subplot(2,2,3);
imshow(bbhe);
title([{' after BBHE ',' AMBE : ' num2str(bbhe_error ) ,'Tm = ' num2str(Tm)}]);

subplot(2,2,4);
imshow(mmbebhe);
title([{' after MMBEBHE ' ,' AMBE : ' num2str(mmbebhe_error) ,'Tk = ' num2str(Tk) }] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I = imread('airplane.bmp');

if size(I,3) == 3
    I = rgb2gray(I);
end

[AMBE_array,~] = CalcMinAMBE (I) ;
[he_error , HE_Image] = HE(I);

[Tm , bbhe] = BBHE(I);
bbhe_error = AMBE_array(Tm+1);
[Tk , mmbebhe_error , mmbebhe] = MMBEBHE(I);


figure ;
subplot(2,2,1);
imshow(I);
title(' Original image ');

subplot(2,2,2);
imshow(HE_Image);
title([{' after HE , AMBE : ', num2str(he_error)} ]);

subplot(2,2,3);
imshow(bbhe);
title([{' after BBHE ',' AMBE : ' num2str(bbhe_error ) ,'Tm = ' num2str(Tm)}]);

subplot(2,2,4);
imshow(mmbebhe);
title([{' after MMBEBHE ' ,' AMBE : ' num2str(mmbebhe_error) ,'Tk = ' num2str(Tk) }] );

