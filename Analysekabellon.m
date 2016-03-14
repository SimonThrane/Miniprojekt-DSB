clear; clc;

%Indlæs filen i variablen y ved brug af audioread:
[y, Fsample] = audioread('Vind.wav');

% ***** Antal samples og varighed i sekunder ********************
N = length(y);
Tlength = N/Fsample;

% ***** Beregn DFT på signalet **********************************
X=fft(y,N);

% ***** Frekvensakse setup **************************************
delta_f = Fsample/N;
f_axis = [0:delta_f:Fsample-delta_f];

% ***** Definer hann funktionen (vinduet)***********************
w = hanning(N);

% ***** Gang hann funktionen på funktionen y *******************
%x_hann=y.*w';

% ***** Udklat et signal ***************************************
Smoothen = raw_smooth(X, N-1);

% ***** Plot ***************************************************
figure(1); clf
semilogx(20*log10(abs(X)))
xlabel('Frekvens i Herz')
ylabel('Størrelse i dB ift. 1 Volt')
title('Sample-plot af signalet')




