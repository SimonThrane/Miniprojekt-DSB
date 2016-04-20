clear

N = 100000;

[y fs] = audioread('The-sonata-piano-loop.mp3');



y = y(1:N);

%y = rot90(y);

Y = fft(y);

x = FIR_WEIGHT(y,0,0,100,1,1);

X = fft(x);


clc;
figure(2)
subplot(2,1,1)
semilogx(abs((2/N)*Y(1:0.5*end)));
subplot(2,1,2)
semilogx(abs((2/N)*X(1:0.5*end)));

soundsc(y,fs);
pause(5);
soundsc(x,fs);

