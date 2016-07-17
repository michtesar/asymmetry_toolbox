function FAA = asymmetry_index (minFreq, maxFreq, lChan, rChan)
    %% Compute FAA index from given data
    % ==================================
    % Computes frontal alpha asymmetry from specified data - channels,
    % frequency and latency.
    %
    % Michael Tesar <tesarm@jcu.cz>
    % Ceske Budejovice, 2016
    %
    %  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____  ____ 
    % ||n ||||e ||||u ||||r ||||o ||||p ||||a ||||c ||||a ||||b ||||r ||||a ||
    % ||__||||__||||__||||__||||__||||__||||__||||__||||__||||__||||__||||__||
    % |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|
    %
    %% Prepare info
    % Geet channel location
    EEG = evalin( 'base', 'EEG' );
    LABEL = {EEG.chanlocs.labels}.';
    
    left = strfind(LABEL,lChan); 
    indLeft = find(~cellfun(@isempty,left));
    right = strfind(LABEL,rChan);
    indRight = find(~cellfun(@isempty,right));

    tmpData = mean(EEG.data, 3);
    L = tmpData(indLeft, :);
    R = tmpData(indRight, :);
    
    %% Compute power spectrum for left channel
    WIND = hamming(floor(length(L))/1.5);   % Get 1.5 sec time windows
    OVER = floor((length(L))/1.5/2);        % 50% overlap
    SIGN = L';                              % Get signal
    [s, freqs, t, power] = spectrogram(SIGN, WIND, OVER, [], EEG.srate);
    indFreqs = find(freqs>minFreq & freqs<maxFreq);
    POW_L = power(indFreqs);
    %% Compute power spectrum for right channel
    WIND = hamming(floor(length(R))/1.5);   % Get 1.5 sec time windows
    OVER = floor((length(R))/1.5/2);        % 50% overlap
    SIGN = R';                              % Get signal
    [s, freqs, t, power] = spectrogram(SIGN, WIND, OVER, [], EEG.srate);
    indFreqs = find(freqs>minFreq & freqs<maxFreq);
    POW_R = power(indFreqs);
    %% Compute whole FAA
    FAA = mean(abs(log(POW_R)-log(POW_L)))
end