l=256; %number of gray scales
f =@(r) (r./3).*(r<3*l/8)+(3.*r-l).*(3*l/8<=r<5*l/8)+((r+2)*l/3).*...     %%contrast strching function 
    (r>5*l/8);
c_img =f(img);
figure; 
subplot(1,2,1);
imshowpair(img,c_img,'montage');
title('original and contrast strech image');
subplot(1,2,2);
c_img=f(hist_img);
imshowpair(hist_img,c_img,'montage');
title('histeq and constant strech images  ');