function bg_on(figure_handle)
% Set the background of a figure white
figure_handle.Color = 'w';
number_of_children  = length(figure_handle.Children);
       for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               figure_handle.Children(p).Color = 'w';
           end
       end 
end