% https://www.ncbi.nlm.nih.gov/books/NBK536878/
% https://www.qaly.co/post/what-atrial-fibrillation-afib-looks-like-on-your-watch-ecg
% https://www.youtube.com/watch?v=tPqs4xKPG3A

%% Section 1: Import and Data Preparation %%
load("ecgSignals.mat");

% Cutting down doubly-sized first dataset to length of other sets
ecgsig{1} = ecgsig{1}(1:9000);

% Initializing cells for storing post-processing data
analysis_data = zeros(10, 8);

%% Section 2: Plotting and Data Manipulation %%

% Range of Interest
roi = 601:1200; 

% Scaling points over 30 seconds in accordance with 300 Hz sampling rate
x = linspace(0, 2, length(roi));

for r = 1:2
    for c = 1:4
        patient = 4*(r-1)+c;

        subplot(2, 4, patient);
        plot(x,ecgsig{patient}(roi));

        title(sprintf("ECG for Patient #%d", patient));
        ylabel("Amplitude (mV)");
        xlabel("Time (s)");
          


        %% Section 2.1: Measurements and Post Processing %%

        % Standard deviation of distance between R peaks
        [peaks, locations] = findpeaks(ecgsig{patient}, 'MinPeakHeight', 500, 'MinPeakDistance', 0.04);
        distances = diff(locations);
        analysis_data(1, patient) = sprintf("%05.2f", std(distances));
        
        % Heartrate in BPM
        analysis_data(2, patient) = sprintf("%d", length(locations)*2);

        % Number of smaller peaks between R peaks which indicate
        % fibrillatory waves
        turns = diff(sign(diff(ecgsig{patient}(roi))));
        analysis_data(3, patient) = sprintf("%d", sum(turns ~= 0));
        
        % Need to figure out how to filter by QRS complex
    end
end

sgtitle("ECG Plots for Atrial Fibrillation Detection");
