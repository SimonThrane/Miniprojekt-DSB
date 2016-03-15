clear; clc;

%Indlæs filen i variablen y ved brug af audioread:
[y, Fsample] = audioread('Symphony-sounds.wav');

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
w = hanning(N);

% ***** Gang hann funktionen på funktionen y *******************
x_hann=x.*w';

W = fft(x_hann,N);

% ***** Udklat et signal ***************************************
%Smoothen = raw_smooth(X, N-1);
[f_oct3, Xm] = oct_smooth(X, Fsample, 12, [1 40000]);
%S_female_smooth = raw_smooth(W, 31);
%S_female_smoothdB = 20*log10(abs(S_female_smooth));


Music_oct12dB = 20*log10(abs((2/N)*Xm));

% ***** Plot ***************************************************
figure(1); clf
subplot(2,2,1);
semilogx(20*log10(abs((2/N)*X(1:0.5*(end-1)))))
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('Symfoni DFT-signal')
grid on

subplot(2,2,2);
semilogx(20*log10(abs((2/N)*W(1:0.5*(end-1)))))
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('Symfoni med Hanning vindue')
grid on

subplot(2,2,3);
semilogx(f_oct3, Music_oct12dB)
xlabel('Frekvens')
ylabel('Styrke')
title('Udglattet signal')
grid on

subplot(2,2,4);
plot(x)
xlabel('Samples')
ylabel('Amplitude (volt)')
title('Originalsignal Symfoni')
grid on




