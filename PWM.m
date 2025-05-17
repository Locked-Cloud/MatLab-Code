fs = 10000;
t = 0:1/fs:0.1;
fm = 100;          % Modulating frequency (Hz)
fc = 1000;        % Carrier frequency (sawtooth)
Am = 1;
Ac = 2;

modulating_signal = Am * cos(2 * pi * fm * t);
mod_norm = (modulating_signal + 1) / 2;

saw = sawtooth(2 * pi * fc * t, 1);
saw_norm = (saw + 1) / 2;

pwm_binary = double(mod_norm > saw_norm);
pwm_signal = Ac * pwm_binary;

figure;

subplot(3,1,1);
plot(t, modulating_signal, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Modulating Signal (Two Full Cycles)');

subplot(3,1,2);
plot(t, pwm_signal, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-0.5 Ac+0.5]);
grid on;
title('Pulse Width Modulated (PWM) Signal');
