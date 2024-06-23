%Resizing image methods:
[file, path] = uigetfile('.tif');
img = imread([path file]);
img = imadjust(img);
maxandmin = [max(img(:)) min(img(:))];
iminfo = imfinfo([path file]);
subplot(2,3,1);
imshow(img);
title('original image');
%imshow(img,[0 n] or [min(img(:)) max(img(:))];
subplot(2,3,2);
reimg1 = imresize(img,0.5,'nearest');
imshow(reimg1);
title('resize nearest')
subplot(2,3,3);
reimg2 = imresize(img,0.5,'bilinear');
imshow(reimg2);
title('resize bilinear');
subplot(2,3,4);
reimg3 = imresize(img,0.5,'bicubic');
imshow(reimg3);
title('resize bicubic');
img=cast(img,'double');