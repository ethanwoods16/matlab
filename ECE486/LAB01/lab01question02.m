% Loading handel sound file
load handel.mat

% Directions specifically ask for storing waveform in array x
x = y;

% Sample rate stepped up for each step of Q2
sampling_rate = 4;

% Downsampling waveform and saving into new vector
sampled = downsample(x, sampling_rate);

% Playing sampled waveform
sound(sampled, 8192/sampling_rate)

% Saving sampled waveform to file
audiowrite('handel_sampled.wav',x,sample_rate)