function save_pdf(figure_handle,file_name)
% Input:  figure_handle and file_name. file_name without '.pdf'
% Putout: PDF

% Example
% save_pdf(figure(1),'test')

% Backup the figure

% Turn off selected object, this causes problem when exporting PDF
while ~isempty(findobj(figure_handle.CurrentObject,'Selected','on'))
    figure_handle.CurrentObject.Selected = 'off';
end

% Set background transparent 
figure_handle.Color = 'None';
number_of_children  = length(figure_handle.Children);
if number_of_children == 0
exit();
end
       for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               figure_handle.Children(p).Color = 'None';
           end
       end 
       
% Create a folder for the figure
if ~exist('..\figs', 'dir')
    mkdir('..\figs')
end

% Export as PDF
% Exportgraphics is for matlab version 2020+ only
filepath = '.\figs\';

exportgraphics(figure_handle,[filepath file_name '.pdf'],'BackgroundColor','none','ContentType','vector')

% Turn on the back ground
bg_on(figure_handle);
savefig(figure_handle,file_name);
