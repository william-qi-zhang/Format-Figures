function y = number_of_axes(figure_handle)
    % Number of children of a figure
    number_of_children  = length(figure_handle.Children);
    number_of_axes      = 0;
    if  number_of_children~=0   % Not an empty figure
        for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               number_of_axes = number_of_axes + 1;
           end
       end  
    end 
y = number_of_axes;
end