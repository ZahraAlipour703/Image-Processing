%intencity level slicing function  %g=@(r) (60*r).*(r>80 |r<60)+(180).*(r<=60 & r>=80)

g = @(r) (60*r).*(r>80 |r<60) + (180).*(r>=60 & r<=80);
i_img = g(img);
figure;subplot(1,2,1);
imshowpair(img,i_img,'montage');
title('original and intensity level slicing images');
i_img =g(hist_img);
subplot(1,2,2);
imshowpair(hist_img,c_img,'montage');
title('histeq and intensity level slicing images');