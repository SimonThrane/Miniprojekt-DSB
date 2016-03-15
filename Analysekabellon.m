clear; clc;

%Indlæs filen i variablen y ved brug af audioread:
[y, Fsample] = audioread('Motorcycle Engine-SoundBible.com-295926986.mp3');


% ***** Antal samples og varighed i sekunder ********************
N = length(y);
Tlength = N/Fsample;

% ***** Beregn DFT på signalet **********************************
X=fft(y,N);

% ***** Frekvensakse setup **************************************
delta_f = Fsample/N;
f_axis = [0:delta_f:Fsample-delta_f];

% ***** Definer hann funktionen (vinduet)***********************
w = hanning(1);

% ***** Gang hann funktionen på funktionen y *******************
x_hann=y.*w';

W = fft(x_hann,N);

% ***** Udklat et signal ***************************************
%Smoothen = raw_smooth(X, N);
[f_oct3, Xm] = oct_smooth(W, Fsample, 20, [1 65536]);
%[f_oct3, S_female_oct3] = oct_smooth(S_female_left, fsample, 3, [20 20000]);
%S_female_smooth = raw_smooth(W, 31);
%S_female_smoothdB = 20*log10(abs(S_female_smooth));


S_female_oct3dB = 20*log10(abs(Xm));




% ***** Plot ***************************************************
figure(1); clf
subplot(2,2,1);
semilogx(20*log10(abs(X)))
xlabel('Frekvens i Herz')
ylabel('Størrelse i dB ift. 1 Volt')
title('Motorcykel uudglatet plot')
grid on

subplot(2,2,2);
semilogx(f_oct3, S_female_oct3dB,'g','linewidth',2)
xlabel('Frekvens i Herz')
ylabel('Størrelse i dB ift. 1 Volt')
title('Oct-udglatet plot af motercykel')
grid on

subplot(2,2,3);
plot(X,)
xlabel('Samples')
ylabel('Styrke')
title('Originalsignal')
grid on


