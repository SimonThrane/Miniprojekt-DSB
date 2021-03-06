clear; clc;

N = 100000;

[y fs] = audioread('The-sonata-piano-loop.mp3');


y = y(1:N);

%y = rot90(y);

%Foretag FFT p� signalet
Y = fft(y);

x = FIR_WEIGHT(y,1,10,0.1,0.1,1);

%Foretag FFT p� det v�gtede signal
X = fft(x);

clc;
figure(1)
subplot(2,1,1)
semilogx(abs((2/N)*Y(1:0.5*end)));
xlabel('Frekvens')
ylabel('dB')
subplot(2,1,2)
semilogx(abs((2/N)*X(1:0.5*end)));
xlabel('Frekvens')
ylabel('dB')

soundsc(y,fs);
pause(5);
soundsc(x,fs);

