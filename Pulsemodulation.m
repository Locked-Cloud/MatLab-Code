%Plus_mod
fs=50000;
T=0.02;
t=0:1/fs:T;

fc_PAM=3000;
fm_PAM=300;
Am=1;
Ac=2;

modulating_signal_PAM=cos(2*pi*fm_PAM*t);
%Pulse Amplitude Modulation
PAM=modulating_signal_PAM.*(square(2*pi*fc_PAM*t)+1)/2;
%Pulse Width Modulation
fc_PWM=500;
fm_PWM=50;

modulating_signal_PWM=cos(2*pi*fm_PWM*t);
modulating_norm=(modulating_signal_PWM+1)/2;

saw=sawtooth(2*pi*fc_PWM*t,1);
saw_norm=(saw+1)/2;

PWM_binary=double(modulating_norm>saw_norm);
PWM=Ac*PWM_binary;

%Pulse Position Modulation
fc_PPM=1500;
fm_PPM=150;

modulating_signal_PPM=Am*cos(2*pi*fm_PPM*t);
samples=modulating_signal_PPM(1:fs/fc:end);

PPM=zeros(size(t));
PPM_width=round(0.0005*fs);
for k=1:length(samples)
   pulse_pos=round((k-1)*fs/fc+round((samples(k)/Am)*fs/(2*fc)));
   if pulse_pos>0 && pulse_pos+pulse_width <=length(PPM)
       PPM(pulse_pos:pulse_pos+pulse_width)=Ac;
   end;
end;

figure;
subplot(6,1,1);
plot(t,modulating_signal_PAM,'r');
xlabel('Time (t)');
ylabel('Amplitude');
title('modulating signal PAM');

subplot(6,1,2);
plot(t,PAM,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('pulse amplitude modulation');

subplot(6,1,3);
plot(t,modulating_signal_PWM,'r');
xlabel('Time (t)');
ylabel('Amplitude');
title('modulating signal PWM');

subplot(6,1,4);
plot(t,PWM,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('pulse width modulation');

subplot(6,1,5);
plot(t,modulating_signal_PPM,'r');
xlabel('Time (t)');
ylabel('Amplitude');
title('modulating signal PPM');

subplot(6,1,6);
plot(t,PPM,'k');
xlabel('Time (t)');
ylabel('Amplitude');
title('pulse position modulation');
