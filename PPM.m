fs = 50000;
T = 0.02;
t = 0:1/fs:T;

fc = 2000;
fm = 200;
Am = 1;
Ac = 2;

modulating_signal = Am * cos(2 * pi * fm * t);
samples = modulating_signal(1:fs/fc:end); % Sample at pulse rate
ppm_t = 0:1/fs:T;

ppm_signal = zeros(size(ppm_t));
pulse_width = round(0.0005 * fs); % fixed width
for k = 1:length(samples)
    pulse_pos = round((k-1)*fs/fc + round((samples(k)/Am)*fs/(2*fc)));
    if pulse_pos > 0 && pulse_pos+pulse_width <= length(ppm_signal)
        ppm_signal(pulse_pos:pulse_pos+pulse_width) = Ac;
    end
end

figure;

subplot(3,1,1);
plot(t, modulating_signal, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Modulating Signal (Message)');

subplot(3,1,2);
plot(ppm_t, ppm_signal, 'k');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
title('Pulse Position Modulated (PPM) Signal');
