function plot_5G_throughput()
    % Parameters
    BW = 100e6;  % Bandwidth of 100 MHz
    SNRs = linspace(0, 30, 100);  % SNR values from 0 to 30 dB
    num_users = 10;  % 10 users
    num_antennas = 4;  % 4 antennas in MIMO configuration

    % Preallocate arrays
    throughput_downlink = zeros(1, length(SNRs));
    throughput_uplink = zeros(1, length(SNRs));

    % Simulation
    for i = 1:length(SNRs)
        [downlink, uplink] = simulate_5G_advanced_link(BW, 10^(SNRs(i)/10), num_users, num_antennas);
        throughput_downlink(i) = downlink / 1e6;  % Convert to Mbps
        throughput_uplink(i) = uplink / 1e6;  % Convert to Mbps
    end

    % Plotting
    figure;
    plot(SNRs, throughput_downlink, 'b-', 'DisplayName', 'Downlink Throughput');
    hold on;
    plot(SNRs, throughput_uplink, 'r--', 'DisplayName', 'Uplink Throughput per User');
    title('Throughput vs. SNR for a 5G Network with MIMO and Interference');
    xlabel('SNR (dB)');
    ylabel('Throughput (Mbps)');
    legend('show');
    grid on;
    hold off;
end

function [throughput_downlink, throughput_uplink] = simulate_5G_advanced_link(BW, SNR, num_users, num_antennas)
    spectral_efficiency_base = 5;  % Base spectral efficiency in bits/s/Hz
    spectral_efficiency = spectral_efficiency_base * log2(1 + num_antennas);  % Simplified MIMO gain

    % Simulate Interference
    interference_noise_ratio = 0.1;  % Ratio of interference to noise
    effective_SNR = SNR / (1 + interference_noise_ratio * num_users);  % Adjust SNR for interference

    % Adaptation of data rate based on effective SNR
    data_rate_factor = log2(1 + effective_SNR);  % Adaptive rate change based on channel conditions

    % Data rate calculations
    throughput_downlink = BW * spectral_efficiency * data_rate_factor;  % Effective throughput
    throughput_uplink = throughput_downlink / num_users;  % Assume equal share among users
end
