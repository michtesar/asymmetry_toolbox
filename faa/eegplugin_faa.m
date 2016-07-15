% eegplugin_pca() - a pca plug-in
function eegplugin_faa(fig, try_strings, catch_strings)
    % Create menu
    toolsmenu = findobj(fig, 'tag', 'tools');
    submenu = uimenu( toolsmenu, 'label', 'Compute FAA');
    
    % Compute FAA index
    uimenu( submenu, 'label', 'Compute FAA index', 'callback',...
        'faa_index');
end