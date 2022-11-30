clc
close all
warning off

obj = imread('banana.png');
figure, imshow(obj);
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
figure, imshow(RGB);R(~BWfinal) = 0;

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
