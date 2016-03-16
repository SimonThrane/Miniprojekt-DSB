clear; clc;

%Indlæs filen i variablen y ved brug af audioread:
[y, Fsample] = audioread('Wine-glass-hit-eb6.wav');

% ***** Roter matrixen 90 grader ********************************
B = rot90(y);

% ***** Udvælg 1 signal *****************************************
x = B(1,:);

% ***** Antal samples og varighed i sekunder ********************
N = length(x);
Tlength = N/Fsample;

% ***** Beregn DFT på signalet **********************************
X=fft(x,N);

% ***** Frekvensakse setup **************************************
delta_f = Fsample/N;
f_axis = [0:delta_f:Fsample-delta_f];

% ***** Definer hann funktionen (vinduet)***********************
h = hanning(200);

w=rot90(h);

w1 = [w(1:100), ones(1, N-100)];

% ***** Gang hann funktionen på funktionen y *******************
x_hann=x.*w1;

W = fft(x_hann,N);

% ***** Udklat et signal ***************************************
%Smoothen = raw_smooth(X, N-1);
[f_oct3, Xm] = oct_smooth(X, Fsample, 12, [1 40000]);


Music_oct12dB = 20*log10(abs((2/N)*Xm));

% ***** Plot ***************************************************
figure(1); clf
subplot(2,2,1);
semilogx(f_axis(1:0.5*end),20*log10(abs((2/N)*X(1:0.5*(end)))))
xlabel('Frekvens i Herz')
ylabel('Størrelse i dB ift. 1 Volt')
title('Vinglas DFT-signal')
grid on

subplot(2,2,2);
semilogx(f_axis(1:0.5*end),20*log10(abs((2/N)*W(1:0.5*(end)))))
xlabel('Frekvens i Herz')
ylabel('Størrelse i dB ift. 1 Volt')
title('Vinglas med Hanning vindue')
grid on

subplot(2,2,3);
semilogx(f_oct3, Music_oct12dB)
xlabel('Frekvens i Herz')
ylabel('Størrelse i dB ift. 1 Volt')
title('Udglattet signal')
grid on

subplot(2,2,4);
plot(x(1:40000))
xlabel('Samples')
ylabel('Amplitude (volt)')
title('Originalsignal Vinglas')
grid on




