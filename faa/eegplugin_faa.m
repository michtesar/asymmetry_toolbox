% This book/study is a result of the research funded by the project 
% Nr. LO1611 with a financial support from the MEYS under the NPU I program.
function eegplugin_faa(fig, try_strings, catch_strings)
    % Create menu
    toolsmenu = findobj(fig, 'tag', 'tools');
    submenu = uimenu( toolsmenu, 'label', 'Compute FAA');
    
    % Compute FAA index
    uimenu( submenu, 'label', 'Compute FAA index', 'callback',...
        'faa_index');
end
