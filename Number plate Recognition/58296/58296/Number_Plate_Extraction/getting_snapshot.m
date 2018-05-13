clc;
clear all;
close all;
vid = videoinput('winvideo', 2,'YUY2_640x480');
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb');
vid.FrameGrabInterval = 0.5;
start(vid);

snapshot=getsnapshot(vid);
imagesc(snapshot)
imwrite(snapshot,'test234.png')
numberPlateExtraction
stop(vid);