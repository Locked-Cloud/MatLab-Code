% --- Parameters ---
fs = 10000;                     % Sampling frequency (Hz)
t = 0:1/fs:0.1;                 % Time vector (0.1 seconds)
fm = 100; fc = 1000;            % Message and carrier frequencies (Hz)
Am = 1; Ac = 2;                 % Amplitudes
kf = 5000;                      % Frequency sensitivity

% --- FM Modulation ---
m = Am * cos(2*pi*fm*t);                      % Message signal
c = Ac * cos(2*pi*fc*t);                      % Carrier signal
s_fm = Ac * cos(2*pi*fc*t + kf * cumsum(m)/fs); % FM modulated signal

% --- FM Demodulation using Hilbert Transform ---
analytic_signal = hilbert(s_fm);                    % Complex signal
inst_phase = unwrap(angle(analytic_signal));        % Instantaneous phase
inst_freq = [0 diff(inst_phase)] * fs / (2*pi);     % Instantaneous frequency
m_demod = (inst_freq - fc) / kf;                    % Recover original message

% --- Plotting ---
figure;

subplot(4,1,1);
plot(t, m, 'r', 'LineWidth', 1.2);
title('Original Message Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4,1,2);
plot(t, c, 'b');
title('Carrier Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4,1,3);
plot(t, s_fm, 'k');
title('FM Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4,1,4);
plot(t, m_demod, 'g', 'LineWidth', 1.2);
title('Demodulated Message Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
