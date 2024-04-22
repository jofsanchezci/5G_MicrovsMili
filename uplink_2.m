function [throughput_downlink, throughput_uplink] = simulate_5G_advanced_link(BW, SNR, num_users, num_antennas)
    % Constants
    spectral_efficiency_base = 5;  % Base spectral efficiency in bits/s/Hz

    % Adjust spectral efficiency with MIMO gains
    spectral_efficiency = spectral_efficiency_base * log2(1 + num_antennas);  % Simplified MIMO gain

    % Simulate Interference
    interference_noise_ratio = 0.1;  % Ratio of interference to noise
    effective_SNR = SNR / (1 + interference_noise_ratio * num_users);  % Adjust SNR for interference

    % Adaptation of data rate based on effective SNR
    data_rate_factor = log2(1 + effective_SNR);  % Adaptive rate change based on channel conditions

    % Data rate calculations
    throughput_downlink = BW * spectral_efficiency * data_rate_factor;  % Effective throughput
    throughput_uplink = throughput_downlink / num_users;  % Assume equal share among users

    % Display results
    fprintf('Downlink Throughput: %.2f Mbps\n', throughput_downlink / 1e6);
    fprintf('Uplink Throughput per user: %.2f Mbps\n', throughput_uplink / 1e6);
end


BW = 100e6;  % Ancho de banda de 100 MHz
SNR = 10;  % Relación señal a ruido de 10
num_users = 10;  % 10 usuarios
num_antennas = 4;  % 4 antenas en configuración MIMO

[downlink, uplink] = simulate_5G_advanced_link(BW, SNR, num_users, num_antennas);
