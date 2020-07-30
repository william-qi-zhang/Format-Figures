function y_label_subplot(figure_handle,y_label_text)
    % add y_label to subplot
    % Input, handle and the label text as cell array, e.g. {'ylabel1','ylabel2'}
    % The label text goes from bottom to top
    if ~isa(y_label_text,'cell')
        disp('Wrong data type for the label. Use cell array.') 
        return
    end
    % Number of children of a figure
    number_of_children  = length(figure_handle.Children);    
    
    axes_index = 0;
    Number_of_labels_to_add = length(y_label_text);
    Number_of_axes          = number_of_axes(figure_handle);
    if Number_of_labels_to_add > Number_of_axes
        disp('Too many labels, please check dimensions')
        return
    end
    
    if  number_of_children~=0   % Not an empty figure
        for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               axes_index = axes_index + 1;
               if axes_index <= Number_of_labels_to_add
                   label_text = y_label_text(axes_index);
                   figure_handle.Children(p).YLabel.String = label_text;
               else
                   return;
               end
           end
       end  
    end 
end