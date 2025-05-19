%AM
fs=50000;
T=0.02;
t=0:1/fs:T;

fc=3000;
fm=300
Am=1;
Ac=1;
m=Am/Ac;

modulating_signal=Am*cos(2*pi*fm*t);
carrier_signal=Ac*cos(2*pi*fc*t);

AMDSB_LC=Ac*(1+m*cos(2*pi*fm*t)).*carrier_signal;

AMDSB_SC=modulating_signal.*carrier_signal;

shifted_message=imag(hilbert(modulating_signal));

AMSSB_SC=modulating_signal.*carrier_signal-shifted_message.*sin(2*pi*fc*t);

AMSSB_LC=carrier_signal+(modulating_signal.*carrier_signal+shifted_message.*sin(2*pi*fc*t));

figure;
subplot(6,1,1);
plot(t,modulating_signal,'r');
xlabel('Time (t)');
ylabel('Amplitude');
title('modulating signal');

subplot(6,1,2);
plot(t,carrier_signal,'b');
xlabel('Time (t)');
ylabel('Amplitude');
title('carrier signal');

subplot(6,1,3);
plot(t,AMDSB_LC,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('AM/DSB-LC');

subplot(6,1,4);
plot(t,AMDSB_SC,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('AM/DSB-SC');

subplot(6,1,5);
plot(t,AMSSB_LC,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('AM/SSB-LC');

subplot(6,1,6);
plot(t,AMSSB_SC,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('AM/SSB-SC');
