% Not sure which one is correct. I believe the sample_rate one is right
% considering the downsample sound is downsampled but also not kept at the
% same rate, causing it to be really short

load handel.mat

x = y;

sampling_rate = 8192/4;
sound(x,sampling_rate,8)


%sampling_rate = 4;
%sampled = downsample(x, sampling_rate);

%sound(sampled, 8192/sampling_rate)

%audiowrite('handel_slowed.wav',x,sample_rate)