clear;

[x, Fs]=audioread('Reporters.mp3');

N=1300000;

x = x(1:N);

%x=rot90(x);

x3=hoereapparat;
b4=x3.sosMatrix(:,5);
a4=x3.sosMatrix(:,6);

y = filter(b4,a4,x);

%Foretag FFT på signalet
X = fft(x);

%Foretag FFT på det vægtede signal
Y = fft(y);

%Plot de to signaler, så man kan se forskellen i frekvenserne.
clc;
figure(1)
subplot(2,1,1)
semilogx(abs((2/N)*X(1:0.5*end)));
xlabel('Frekvens')
ylabel('dB')
subplot(2,1,2)
%semilogx(abs((2/N)*Y(1:0.5*end)));
plot(y(1:5000))
xlabel('Frekvens')
ylabel('dB')