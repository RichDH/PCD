clc
close all
warning off

obj = imread('diagonal.png');
figure, imshow(obj);
buah = true;
obj2 = obj;
% figure, imshow(obj);

% edge_detected_image = bwareaopen(imfill(imclose(edge(rgb2gray(obj),'sobel'),strel('diamond',4)),'holes'),100000);
% figure, imshow(edge_detected_image);

obj =imadd(obj, 50);
figure, imshow(obj);
obj = imadjust(obj,[0.2 0.8]);
% obj = imadjust(obj,[0.3 0.7],[]);
figure, imshow(obj);

% obj = rgb2gray(obj);
% obj = edge(obj, 'canny');
% obj = bwareaopen(imfill(imclose(edge(rgb2gray(obj),'canny'),strel('disk',10)),'holes'),100000);
obj = rgb2gray(obj);
obj = edge(obj,'log');
obj = bwareaopen(obj, 30);
figure, imshow(obj);
obj = imclose(obj, strel('disk', 60));
figure, imshow(obj);
obj = imfill(obj, 'holes');
figure, imshow(obj);
BWfinal = imerode(obj,strel('diamond',1));
figure, imshow(BWfinal);

se = strel('sphere',5);
BWfinal = imerode(BWfinal, se);
figure, imshow(BWfinal);

% HSV = rgb2hsv(obj2);
% figure, imshow(HSV);
% 
% H = HSV(:,:,1);
% S = HSV(:,:,2);
% V = HSV(:,:,3);
% 
% H(~obj) = 0;
% S(~obj) = 0;
% V(~obj) = 0;
% 
% Hue = sum(sum(H))/sum(sum(obj));
% Saturation = sum(sum(S))/sum(sum(obj));
% Value = sum(sum(V))/sum(sum(obj));
% Luas = sum(sum(obj));
% 
% figure, imshow(H);
% figure, imshow(S);
% figure, imshow(V);

R = obj2(:,:,1);
G = obj2(:,:,2);
B = obj2(:,:,3);

R(~BWfinal) = 0;
G(~BWfinal) = 0;
B(~BWfinal) = 0;
RGB = cat(3,R,G,B);
figure, imshow(RGB);
total = numel(BWfinal);
Luas = length(BWfinal(BWfinal~=0));

B1 = rgb2gray(RGB);

%deteksi warna
HSV = rgb2hsv(RGB);

H = HSV(:,:,1);
S = HSV(:,:,2);

[r,c,v] = find((H>30/255 & H<54/255 & S>50/255));

numid = size(r,1);
bw = false(size(RGB,1), size(RGB,2));
for i = 1:numid
    bw(r(i),c(i)) =1;
end

bw = imfill(bw, 'holes');
bw = bwareaopen(bw, 1000);

R = RGB(:,:, 1);
G = RGB(:,:, 2);
B = RGB(:,:, 3);

R(~bw) = 0;
G(~bw) = 0;
B(~bw) = 0;
img = cat(3,R,G,B);
figure , imshow(img);

img = imbinarize(rgb2gray(img));
figure, imshow(img);
Luas_kuning = length(img(img~=0));

matang = 'busuk';
if(Luas_kuning >= (Luas/100*40))
    matang = 'segar';
end
if(Luas_kuning <= 1)
    matang = 'bukan pisang';
end
%j = rgb2gray(img);

%k = imbinarize(j,.95);

% i = double(img);
% figure , imshow(i);
% 
% img = rgb2gray(img);
% figure,imshow(img);
% img = imbinarize(img);
% figure, imshow(img);






% figure, imshow(obj);
% 
% obj = rgb2gray(obj);
% % figure, imshow(obj);
% 
% [~,threshold] = edge(obj,'Log');
% fudgeFactor = 0.7;
% BWs = edge(obj,'Log',threshold * fudgeFactor);
% % figure, imshow(BWs);
% 
% se90 = strel('line',3,90);
% se0 = strel('line',3,0);
% BWsdil = imdilate(BWs,[se90 se0]);
% % figure, imshow(BWsdil);
% 
% bwfill = imfill(BWsdil, 'holes');
% bwfill = bwareaopen(bwfill,200);
% bwfill = bwlabel(bwfill);
% % figure, imshow(bwfill);
% 
% seD = strel('diamond',1);
% BWfinal = imerode(obj,seD);
% figure, imshow(BWfinal);
% BWfinal = imerode(BWfinal,seD);
% BWfinal = imerode(BWfinal,seD);
% BWfinal = imerode(BWfinal,seD);
% BWfinal = imerode(edge_detected_image,seD);
% figure, imshow(BWfinal);
% 
