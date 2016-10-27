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
if ~isempty(EEG.chanlocs)
    labels = {EEG.chanlocs.labels}.';
else
    error('E01 ERROR! No channel location info. Add chanloc first.')
end
%% Get user input
% Decide which channel is right and which is left
[indLeft, lChosen]  = listdlg('PromptString','Pick a left channel:',...
                                  'SelectionMode','single',...
                                  'ListString', labels);
[indRight, rChosen] = listdlg('PromptString','Pick a right channel:',...
                                  'SelectionMode','single',...
                                  'ListString', labels);
if lChosen && rChosen
    tmpData = mean(EEG.data, 3);
    L = tmpData(indLeft, :);
    R = tmpData(indRight, :);
else
    error('E02 ERROR! One or both channel were not chosen. Pick both.');
end
% Pick frequency range
prompt = {'Enter minimal freq [Hz]:','Enter maximal freq [Hz]:'};
dlg_title = 'Specify frequency range';
defaultans = {'8','13'};
answer = inputdlg(prompt,dlg_title,1,defaultans);
FREQ_1 = str2num(cell2mat((answer(1))));
FREQ_2 = str2num(cell2mat((answer(2))));
%% Compute power spectrum for left channel
WIND = hamming(floor(length(L))/1.5);   % Get 1.5 sec time windows
OVER = floor((length(L))/1.5/2);        % 50% overlap
SIGN = L';                              % Get signal
[s, freqs, t, power] = spectrogram(SIGN, WIND, OVER, [], EEG.srate);
indFreqs = find(freqs>FREQ_1 & freqs<FREQ_2);
POW_L = power(indFreqs);
%% Compute power spectrum for right channel
WIND = hamming(floor(length(R))/1.5);   % Get 1.5 sec time windows
OVER = floor((length(R))/1.5/2);        % 50% overlap
SIGN = R';                              % Get signal
[s, freqs, t, power] = spectrogram(SIGN, WIND, OVER, [], EEG.srate);
indFreqs = find(freqs>FREQ_1 & freqs<FREQ_2);
POW_R = power(indFreqs);
%% Compute whole FAA
FAA = mean(abs(log(POW_R)-log(POW_L)))