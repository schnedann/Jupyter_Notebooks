fig=1;

fs      = 357e3; #Sampling Frequency
Ts      = 1./fs; #Sampling period
freq    = 750;   #Signal Frequency
periods = 10;    #Number of Periods
amp     = 1.5;   #Signal Amplitude
20.*log10(amp)   #Signal Amplitude in dB

figure(fig++);
tend=periods./freq;
nos = ceil(tend.*fs);
tend = nos./fs;
t=linspace(0,tend,nos);
y=amp.*sin(2.*pi().*t.*freq);
plot(t,y,"-db");
grid on;
title("time discrete sine");
xlabel("time [s]");

range=2.*amp;
bits=12;
LSB=range./(2.^bits);
dy=round((y.+amp)./LSB);
SNR=6.022.*bits+1.76     #Theoretical Noise Floor to best Signal

figure(fig++);
plot(t,dy,"-db");
grid on;
title("discrete sine");
xlabel("time [s]");

nos2=2^ceil(log2(nos));
znos=nos2.-nos;
ze=zeros(1,znos);
dy = [dy ze];

figure(fig++);
f=linspace(0,fs,nos)(1:1:(nos/2));
s=(2./nos).*LSB.*abs(fft(dy)(1:1:(nos/2)));
s(1)=0; #set DC to zero
s(2)=0;
s(3)=0;
max(s) #Get value of fundamental peak
lineresolution=fs./(2.*nos);
plot(f,s,"-db");
grid on;
title("spectrum");
xlabel("frequency [Hz]");

figure(fig++);
sl=20.*log10(s);
max(sl) #Get value of fundamental peak
plot(f,sl,"-db");
grid on;
title("log amplitude spectrum");
xlabel("frequency [Hz]");


