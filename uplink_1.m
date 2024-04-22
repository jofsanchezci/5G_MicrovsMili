function [throughput_downlink, throughput_uplink] = simulate_5G_link(BW, SNR, num_users)
    % Constants
    spectral_efficiency = 5;  % bits/s/Hz, this is a simplified assumption

    % Data rate calculations
    throughput_downlink = BW * spectral_efficiency * log2(1 + SNR);  % Shannon capacity formula
    throughput_uplink = throughput_downlink / num_users;  % Assuming equal share among users

    % Display results
    fprintf('Downlink Throughput: %.2f Mbps\n', throughput_downlink / 1e6);
    fprintf('Uplink Throughput per user: %.2f Mbps\n', throughput_uplink / 1e6);
end

[BW, SNR, num_users] = (100e6, 10, 10);  % 100 MHz, SNR of 10, 10 users
[downlink, uplink] = simulate_5G_link(BW, SNR, num_users);