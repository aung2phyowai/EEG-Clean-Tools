function referenceStruct = getReferenceStructure()
% Creates an empty reference structure
referenceStruct = struct( ...
    'referenceChannels', [], ...
    'evaluationChannels', [], ...
    'rereferencedChannels', [], ...
    'detrendChannels', [], ...
    'detrendType', [], ...
    'detrendCutoff', [], ...
    'detrendStepSize', [], ...
    'detrendCommand', [], ...
    'channelLocations', [], ...
    'channelInformation', [], ...
    'maxReferenceIterations', [], ...
    'actualReferenceIterations', [], ...
    'interpolatedChannelNumbers', [], ...
    'removedChannelNumbers', [], ...
    'badChannels', getBadChannelStructure(), ...
    'badSignalsUninterpolated', [], ...
    'referenceSignalOriginal', [], ...
    'referenceSignal', [], ...
    'noisyStatisticsOriginal', [], ...
    'noisyStatisticsBeforeInterpolation', [], ...
    'noisyStatistics', [], ...
    'reportingLevel', [] ...
    );