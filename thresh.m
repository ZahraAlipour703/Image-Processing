m= 100; alpha = 70;
fun = @(r)  1./(1+m./r).^alpha;
figure;
img = cast(img,'double'); 
hist_img = cast(hist_img,'double');
th_img = fun(img);
subplot(2,2,1);
imshowpair(img,th_img,'montage');
title('original and thresh image ');
subplot(2,2,2);
th_img = fun(hist_img);
imshowpair(hist_img,th_img,'montage');
title('histeq and threshold images');
%%%%ideal thresholing for making binary image==============================
ith_img = max(img(:)).*(img>(2.*mean(img(:))));%0.5.*(max(img(:))./2))); 
                                               %setting is fifferance
                                                      % mean(img(:)))         
subplot(2,2,3);
imshowpair(img,ith_img,'montage');
title('original and ideal threshold images');
subplot(2,2,4);
ith_img = max(hist_img(:)).*(hist_img>(2.*mean(img(:))));%max(hist_img(:))./2))
imshowpair(hist_img,ith_img,'montage');
title('histeq and ideal threshold image');