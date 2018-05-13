clc;
clear all;
close all;
a=audiorecorder(8000,8,1)
record(a,5)
pause(6);
b=getaudiodata(a);
plot(b)
sound(b)
filename = 'test.wav';
audiowrite(filename,b,8000);
clear y Fs