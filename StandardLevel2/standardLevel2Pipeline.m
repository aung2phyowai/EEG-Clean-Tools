%% Standard level 2 pipeline 
% This assumes the following have been set:
%  EEG                       An EEGLAB structure with the data is available
%  referenceChannels         A vector of channels to be used for
%                            rereferencing (Usually these are EEG (no
%                            mastoids or EOG)
%  channelsToBeReferenced    A vector of channels to be high-passed, 
%                            line-noise removed, and referenced. 
%  lineFrequencies           A list of line frequencies
%  thisName                  An identifying dataset name (for plotting)
%  
% Additional setup:
%    EEGLAB should be in the path.
%    The stdlevel2 directory and its subdirectories should be in the path
%

%% Setup
pop_editoptions('option_single', false, 'option_savetwofiles', false);
if isfield(EEG.etc, 'noisyParameters')
    warning('EEG.etc.noisyParameters already exists and will be cleared\n')
end
EEG.etc.noisyParameters = struct('name', thisName, 'version', getStandardLevel2Version);

%% Part I: High pass filter
fprintf('High pass filtering\n');
tic
[EEG, EEG.etc.noisyParameters.highPass] = highPassFilter(EEG, params);
computationTimes.highPass = toc;

%% Part II: Resampling
fprintf('Resampling\n');
tic
[EEG, EEG.etc.noisyParameters.resampling] = resampleEEG(EEG, params);
computationTimes.resampling = toc;

%% Part III: Remove line noise
fprintf('Line noise removal\n');
tic
[EEG, EEG.etc.noisyParameters.lineNoise] = cleanLineNoise(EEG, params);
computationTimes.lineNoise = toc;

%% Part IV: Remove a robust reference
fprintf('Robust reference removal\n');
tic
[EEG, EEG.etc.noisyParameters.reference] = robustReference(EEG, params);
computationTimes.reference = toc;
