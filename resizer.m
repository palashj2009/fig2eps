%% (c) Palash Jain
% This file changes axes properties of all fig files in the sub-directory
% and generate .eps vector files in color
% Create a sub-folder source_figs, and put all .fig files to be modified
% Create a sub-folder resized_eps for modified .eps files with the same name

% Known issue: warning thrown if axes label contains percentage (%) character

list_figures = ls('.\source_figs\*.fig');%detects .fig files in sub-directory
for i = 1:size(list_figures,1)
    disp(strcat('Reading ',list_figures(i,:), '#',...
        num2str(i),' out of ',num2str(size(list_figures,1))));
    openfig(strcat('.\source_figs\',list_figures(i,:)),'invisible');
    name_string = split(list_figures(i,:),'.');
    name_fig = name_string(1,:);
    ax = gca; 
    %% CHANGE PROPERTIES HERE
    ax.FontSize = 14;%default font size x for axes tick labels
    ax.LabelFontSizeMultiplier = 1.1;%default font size 1.1x for axes labels
    ax.FontName = 'Times';%changes font to Times
    ax.FontSizeMode = 'manual';%font-size fixed irrespective of axes size
    saveas(gcf,char(strcat('.\resized_eps\',name_fig)),'epsc');
end