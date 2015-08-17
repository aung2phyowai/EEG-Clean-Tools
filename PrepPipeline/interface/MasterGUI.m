function [paramsOut, okay] = MasterGUI(userData, EEG) 
geometry = {1, [1, 1], [1, 1], [1, 1], [1, 1]};
geomvert = [1,1,1,1,1];
title = 'EEG Clean Tools Main Menu';
inputData = struct('signal', EEG, 'name', title, 'userData', userData);
closeOpenWindows(inputData.name);
uilist= {{'style', 'text', ...
    'string', 'Override default parameters for processing step:'}...
    {'style', 'pushbutton', 'string', 'Boundary', ...
    'Callback', {@boundaryGUI, inputData}} ...
    {'style', 'pushbutton', 'string', 'Resample', ...
    'Callback', {@resampleGUI, inputData}}...
    {'style', 'pushbutton', 'string', 'Global detrend', ...
    'Callback', {@globalTrendGUI, inputData}}...
    {'style', 'pushbutton', 'string', 'Reference', ...
    'Callback', {@referenceGUI, inputData}}...
    {'style', 'pushbutton', 'string', 'Detrend', ...
    'Callback', {@detrendGUI, inputData}}...
    {'style', 'pushbutton', 'string', 'Report', ...
    'Callback', {@reportGUI, inputData}}...
    {'style', 'pushbutton', 'string', 'Line noise', ...
    'Callback', {@lineNoiseGUI, inputData}}...
    {'style', 'pushbutton', 'string', 'Post process', ...
    'Callback', {@postProcessGUI, inputData}}};
[~, userData, buttonPressed, ~] = inputgui('geometry', geometry, ...
    'geomvert', geomvert, ...
    'uilist', uilist, 'title', title, ...
    'helpcom', 'pophelp(''pop_prepPipeline'')');

okay = okayPressed(buttonPressed);
paramsOut = struct();
if ~isempty(userData)
    fNames = fieldnames(userData);
    for k = 1:length(fNames)
        nextStruct = userData.(fNames{k});
        nextNames = fieldnames(nextStruct);
        for j = 1:length(nextNames)
            paramsOut.(nextNames{j}) = nextStruct.(nextNames{j});
        end
    end
end


    function okay = okayPressed(buttonPressed)
        % Returns true if the okay button is pressed, false if otherwise
        okay = false;
        if ~isempty(buttonPressed)
            okay = true;
        end % okayPressed
    end

end % MasterGUI