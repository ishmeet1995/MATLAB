clc;
clear all;
close all;
a=audiorecorder(8000,8,1)
record(a,2)
pause(3);
b=getaudiodata(a);
plot(b)
sound(b)
filename = 'test.wav';
audiowrite(filename,b,8000);
filename2='one.wav'
audiowrite(filename2,b,8000);
clear y Fs

speechrecognition('one.wav')