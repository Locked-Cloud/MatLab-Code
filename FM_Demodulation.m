% --- Parameters ---
fs = 10000;             % Sampling frequency (Hz)
T = 1;                  % Signal duration (seconds)
t = 0:1/fs:T;           % Time vector
fm = 5;                 % Message frequency (Hz)
fc = 200;               % Carrier frequency (Hz)
Am = 1;                 % Message amplitude
Ac = 2;                 % Carrier amplitude
kf = 200;               % Frequency sensitivity

% --- Message Signal ---
m = Am * cos(2*pi*fm*t);   

% --- FM Signal ---
int_m = cumsum(m)/fs;                          % Integrate message
s_fm = Ac * cos(2*pi*fc*t + 2*pi*kf*int_m);    % FM modulation

% --- Frequency Demodulation (Discriminator method) ---
diff_fm = [0 diff(s_fm)] * fs;                 % Differentiate FM signal
envelope = abs(hilbert(diff_fm));             % Extract envelope

% --- DC Removal and Low-Pass Filtering ---
dc_removed = envelope - mean(envelope);       
[b, a] = butter(6, 0.02);                      % 6th-order LPF
m_demod = filter(b, a, dc_removed);           

% --- Normalize Demodulated Signal ---
m_demod = m_demod * (Am / max(abs(m_demod))); 

% --- Plotting ---
figure;

subplot(3,1,1);
plot(t, m, 'r', 'LineWidth', 1.2);
title('Original Message Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,2);
plot(t, s_fm, 'k');
title('FM Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,3);
plot(t, m_demod, 'b', 'LineWidth', 1.2);
title('Demodulated Message (Discriminator)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
