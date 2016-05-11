clear; clc;
%H�reapparat

[x, Fs]=audioread('Reporters.mp3');
N = 1000000;

x = x(1:N);

x=rot90(x);

%Foretag FFT p� signalet
X = fft(x);

y = WEIGHT_func(x,10,10,10,10,10);

%Foretag FFT p� det v�gtede signal
Y = fft(y);

%Plot de to signaler, s� man kan se forskellen i frekvenserne.
clc;
figure(1)
subplot(2,1,1)
semilogx(abs((2/N)*X(1:0.5*end)));
xlabel('Frekvens')
ylabel('dB')
subplot(2,1,2)
semilogx(abs((2/N)*Y(1:0.5*end)));
xlabel('Frekvens')
ylabel('dB')

soundsc(x,Fs);
pause(10);
soundsc(y,Fs);