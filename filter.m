clc;
clear;
close all;
%load  im image
%[file path]= uigetfile();
%img=imread([path file]);
[file, path] = uigetfile();
img = imread([path file]);
img=imadjust(img);
img=imresize(img,0.25,'nearest');
%%image filter:average,disk,gaussian,laplacian,log,motion,prewitt,sobel
%average
avg_filt=fspecial('average',10);
avg_img=imfilter(img,avg_filt);
figure();
subplot(2,5,1);
imshowpair(img,avg_img,'montage');
title('org vs average image');
%%logical threshold 
th_img=im2bw(img,0.5);
th_avg_img=(im2bw(avg_img,0.5));
subplot(2,5,2);
imshowpair(th_img,th_avg_img,'montage');
title('org vs average threshold binary image');
%goasian a namayi plot
goas_filt=fspecial('gaussian',5,100);
goas_img=imfilter(img,goas_filt);
subplot(2,5,3);imshowpair(img,goas_img,'montage');
title('original vs goasian filter image');
th_gau_img=imfilter(th_img,goas_filt);
subplot(2,5,4);imshowpair(th_img,th_gau_img,'montage');
title('thresh vs gaussian thresh');
%laplacian
laplas_filt=fspecial('laplacian',0.00005);
laplas_img=imfilter(img,laplas_filt);
subplot(2,5,5);imshowpair(img,laplas_img,'montage');
title('org vs laplas');
laplas_th=imfilter(th_img,laplas_filt);
subplot(2,5,6);imshowpair(th_img,laplas_th,'montage');
title('th vs laplas');
%sobel
sob_filt=fspecial('sobel');
sob_img=imfilter(img,sob_filt);
subplot(2,5,7);imshowpair(img,sob_img,'montage');
title('org vs sobel');
th_sob_img=imfilter(th_img,sob_filt);
subplot(2,5,8);imshowpair(th_img,th_sob_img,'montage');
title('th vs sobel');
%laplacian of gaussian=> log
log_filt=fspecial('log');
log_img=imfilter(img,log_filt);
subplot(2,5,9);imshowpair(img,log_img,'montage');
title('org vs log');
th_log_img=imfilter(th_img,log_filt);
subplot(2,5,10);imshowpair(th_img,th_log_img,'montage');
title('th vs log');
%sharping with laplacian filter
figure;subplot(3,3,1);
imshowpair(img,img-laplas_img,'montage');
title('org vs org-laplac');
subplot(3,3,2);imshowpair(img,histeq(laplas_img),'montage');
title('org vs histeq laplas');
%shrping with sobel
subplot(3,3,3);imshowpair(img,img-sob_img,'montage');
title('org vs org-sobel');
subplot(3,3,4);imshowpair(th_img,th_img-th_sob_img,'montage');
title('th vs th-sob');
subplot(3,3,5);imshowpair(img,img-log_img,'montage');
title('org vs org-log');
%gradient of image
subplot(3,3,6);
grad_img=imgradient(img);
img=cast(img,'double');
imshowpair(img,img-grad_img,'montage');
title('org vsorg-gragient')
%adge 
subplot(3,3,7);
ed_img=edge(img,'canny');
imshowpair(img,ed_img,'montage');
title('edge image');






