%%
% $%%
% 
%   for x = 1:10
% 
% $$e^{\pi i} + 1 = 0$$
% 
%       disp(x)
%   end
% 
% clear; clc;
% 
% %Indl�s filen i variablen y ved brug af audioread:
% [y, Fsample] = audioread('The-sonata-piano-loop.mp3');
% 
% ***** Roter matrixen 90 grader ********************************
% B = rot90(y);
% 
% ***** Udv�lg 1 signal *****************************************
% x = B(1,:);
% 
% ***** Antal samples og varighed i sekunder ********************
% N = length(x);
% Tlength = N/Fsample;
% 
% ***** Beregn DFT p� signalet **********************************
% X=fft(x,N);
% 
% ***** Frekvensakse setup **************************************
% delta_f = Fsample/N;
% f_axis = [0:delta_f:Fsample-delta_f];
% 
% ***** Definer hann funktionen (vinduet)***********************
% w = hanning(N);
% 
% ***** Gang hann funktionen p� funktionen y *******************
% x_hann=x.*w';
% 
% W = fft(x_hann,N);
% 
% ***** Udklat et signal ***************************************
% %Smoothen = raw_smooth(X, N-1);
% [f_oct3, Xm] = oct_smooth(X, Fsample, 12, [1 40000]);
% 
% Music_oct12dB = 20*log10(abs((2/N)*Xm));
% 
% ***** Plot ***************************************************
% figure(1); clf
% semilogx(f_axis(1:0.5*end),20*log10(abs((2/N)*X(1:0.5*(end)))))
% xlabel('Frekvens i Herz')
% ylabel('St�rrelse i dB ift. 1 Volt')
% title('Piano DFT-signal')
% grid on
% 
% figure(2); clf
% semilogx(f_axis(1:0.5*end),20*log10(abs((2/N)*W(1:0.5*(end)))))
% xlabel('Frekvens i Herz')
% ylabel('St�rrelse i dB ift. 1 Volt')
% title('Piano med Hanning vindue')
% grid on
% 
% figure(3); clf
% semilogx(f_oct3, Music_oct12dB)
% xlabel('Frekvens i Herz')
% ylabel('Styrke')
% title('Udglattet signal')
% grid on
% 
% figure(4); clf
% plot(x)
% xlabel('Samples')
% ylabel('Amplitude (volt)')
% title('Originalsignal Piano')
% grid on$




