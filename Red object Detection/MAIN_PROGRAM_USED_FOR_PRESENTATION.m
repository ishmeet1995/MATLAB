
vid=videoinput('winvideo',1,'YUY2_640x480');
a1 = arduino('COM6', 'Uno');
writeDigitalPin(a1,13,0);
set(vid,'ReturnedColorSpace','rgb');
preview(vid);
pause(2);

while 1
    im1=getsnapshot(vid);
    % Now to track red objects in real time
    % we have to subtract the red component
    % from the grayscale image to extract the red components in the image.
    %extract red component  
    im2= imsubtract(im1(:,:,1), rgb2gray(im1));
    in2= imsubtract(im1(:,:,3), rgb2gray(im1));
    im3 = medfilt2(im2, [3 3]);
    in3 = medfilt2(in2, [3 3]);
    im3 = im2bw(im3,0.27);
    in3 = im2bw(in3,0.32);

    imshow(im3);
    pause(0.05);
    [B,L,N]= bwboundaries(im3,'noholes');
    a = regionprops(L,'centroid');
    
    
    if N >= 1 
        y=round(a(1).Centroid(1,2))
       if y>0 && y<160
          writeDigitalPin(a1,2,1);
          writeDigitalPin(a1,3,0); 
       end
       if y>160 && y<320
          writeDigitalPin(a1,2,0);
          writeDigitalPin(a1,3,0);    
       end
       if y>320 && y<480
          writeDigitalPin(a1,2,0);
          writeDigitalPin(a1,3,1);
       end

    end   
  imshow(in3);
    pause(0.05);
    [B,L,N]= bwboundaries(in3,'noholes');
    b = regionprops(L,'centroid');
    
 if N >= 1
     p=round(b(1).Centroid(1,2))
       if p>0 && p<160
          writeDigitalPin(a1,4,1);
          writeDigitalPin(a1,5,0); 
       end
       if p>=160 && p<320
          writeDigitalPin(a1,4,0);
          writeDigitalPin(a1,5,0);    
       end
       if p>=320 && p<480
          writeDigitalPin(a1,4,0);
          writeDigitalPin(a1,5,1);
       end
 end

end