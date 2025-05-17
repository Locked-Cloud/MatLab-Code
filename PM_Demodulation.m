% Basic settings
fs = 10000;            % Sampling frequency (Hz)
t = 0:1/fs:1;          % Time vector (1 second)
fm = 50;               % Frequency of message (Hz)
Am = 1;                % Amplitude of message
fc = 500;              % Carrier frequency (Hz)
kp = pi/2;             % Phase sensitivity (rad per unit of m)


m = Am * cos(2*pi*fm*t);  % Message signal
s_pm = cos(2*pi*fc*t + kp * m);  % PM signal: carrier + modulated phase

inst_phase_pm = unwrap(angle(hilbert(s_pm)));  % Extract phase from signal
demod_pm = (inst_phase_pm - 2*pi*fc*t) / kp;   % Remove carrier and scale back

figure;

subplot(3,1,1);
plot(t, m);
title('Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, s_pm);
title('Phase Modulated Signal (PM)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, demod_pm);
title('Demodulated PM Signal');
xlabel('Time (s)');
ylabel('Amplitude');
