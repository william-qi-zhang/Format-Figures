function x_ticks_off(figure_handle)
    % Number of children of a figure
    number_of_children  = length(figure_handle.Children);
    axes_index = 0;
    if  number_of_children~=0   % Not an empty figure
        for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               axes_index = axes_index + 1; 
               if axes_index>1
                   figure_handle.Children(p).XTick = [];                
               end
           end
       end  
    end 
end