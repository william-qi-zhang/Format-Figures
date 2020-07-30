function x_label_subplot(figure_handle)
    
    temp = ["(a)","(b)","(c)","(d)","(e)","(f)","(g)","(h)","(i)","(j)","(k)","(l)","(m)","n"];
    
    % Number of children of a figure
    number_of_children  = length(figure_handle.Children);
    Number_of_axes      = number_of_axes(figure_handle)
    axes_index = 0;
    
    if  number_of_children~=0   % Not an empty figure
        for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               figure_handle.Children(p).Units = 'centimeters';
               axes_index = axes_index + 1;
               if axes_index == 1
                   
                   figure_handle.Children(p).XLabel.Units = 'data'
                   label_text = char(temp(Number_of_axes - axes_index + 1));
                   figure_handle.Children(p).XLabel.String = {label_text,'Time(s)'};
                   
                   % Position for the time label 
%                    figure_handle.Children(p).XLabel.Position;
%                    y_position = figure_handle.Children(p).XLabel.Position(2);
%                    x_position = figure_handle.Children(p).XLim(2); % To put the time label right, specify the Xlim
%                    % text(axes_handle,...) to choose on which axes for the
%                    % text
%                    t = text(figure_handle.Children(p),x_position,y_position,'time(s)');
%                    t.FontName = 'Times New Roman';
%                    t.FontSize = 8;
%                    t.Interpreter = 'latex';
%                    t.HorizontalAlignment = 'right';
%                    t.VerticalAlignment   = 'top';
               else
                   label_text = char(temp(Number_of_axes - axes_index + 1));
                   figure_handle.Children(p).XLabel.String = label_text;
               end 
           end
       end  
    end 
end