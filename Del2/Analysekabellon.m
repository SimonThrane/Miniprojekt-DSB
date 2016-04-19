clear; clc;

%Indlæs filen i variablen y ved brug af audioread:
[y, Fsample] = audioread('Motorcycle Engine-SoundBible.com-295926986.mp3');

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
%Smoothen = raw_smooth(X, N);
%[f_oct3, Xm] = oct_smooth(W, Fsample, 20, [1 65536]);
%[f_oct3, S_female_oct3] = oct_smooth(S_female_left, fsample, 3, [20 20000]);
%S_female_smooth = raw_smooth(W, 31);
%S_female_smoothdB = 20*log10(abs(S_female_smooth));


%S_female_oct3dB = 20*log10(abs(Xm));

% ***** Plot ***************************************************
figure(1); clf
subplot(2,2,1);
semilogx(20*log10(abs((2/N)*X(1:0.5*end))))
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('Motorcykel DFT-signal')
grid on

subplot(2,2,2);
semilogx(20*log10(abs((2/N)*W(1:0.5*end))))
xlabel('Samplebins')
ylabel('Størrelse i dB ift. 1 Volt')
title('Motorcykel med Hanning vindue')
grid on

subplot(2,2,3);
plot(x)
xlabel('Samples')
ylabel('Styrke')
title('Originalsignal Motorcykel')
grid on

subplot(2,2,4);
plot(20*log10(abs(X)))
xlabel('Frekvens')
ylabel('Styrke')
title('Motorcykel')
grid on


