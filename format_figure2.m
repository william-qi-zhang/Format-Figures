% Format a plot for IEEE publication

% For every figure, there are different children, i.e. axes, legend. Lines are children of axes.
% Thus, we loop through different children of the figure object to
% modify the coressponding atrributes

function format_figure2(figure_handle,height)
% Input: figure handle and the height for the figure in centimeters
% the height is for every plot.

    number_of_rows      = 3;
    number_of_columns   = 2;
    
    figure_handle.Units = 'centimeters'; 
     
    figure_handle.Position(3) = 20; % 
    
    figure_handle.Position(1) = 0;  % Move the formatted figure to the left conor of the screen
    figure_handle.Position(2) = 0;

    % Number of children of a figure
    number_of_children  = length(figure_handle.Children);

    if  number_of_children~=0   % Not an empty figure
        number_of_axes       = 0;
        current_axes_index   = 0;
        for p = 1:1:number_of_children   % Find number of axes
            if strcmpi(figure_handle.Children(p).Type,'axes')
                number_of_axes = number_of_axes + 1; 
            end
        end
        
       % Format the properties of Axes;
        for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               current_axes_index = current_axes_index + 1;
               % gird on
%                figure_handle.Children(p).XGrid = 'on';
%                figure_handle.Children(p).YGrid = 'on';
               % 
               figure_handle.Children(p).Units = 'centimeter';
               % Position, left bottom width height
               
%              % size of every subfigure   
               figure_handle.Children(p).Position(3) = 6.5; 
               figure_handle.Children(p).Position(4) = height;
               % Font for ticks
               figure_handle.Children(p).FontName = 'Times New Roman';
               figure_handle.Children(p).FontSize = 8;
               figure_handle.Children(p).FontUnits = 'points';
               % XY label
               figure_handle.Children(p).XLabel.FontName = 'Times New Roman';
               figure_handle.Children(p).XLabel.FontSize = 8;
               figure_handle.Children(p).XLabel.Interpreter = 'latex';
               figure_handle.Children(p).XLabel.Units = 'data'; 
               figure_handle.Children(p).YLabel.FontName = 'Times New Roman';
               figure_handle.Children(p).YLabel.FontSize = 8;       
               figure_handle.Children(p).YLabel.Interpreter = 'latex';
               figure_handle.Children(p).XLabel.Units = 'data'; 
               % Title
               figure_handle.Children(p).Title.FontName = 'Times New Roman';
               figure_handle.Children(p).Title.FontSize = 8;       
               figure_handle.Children(p).Title.Interpreter = 'latex';
               % unit?
               % Linewidth of the box
               figure_handle.Children(p).LineWidth = 0.5; 
               % Lines are children of axes object
               % Format the lines in the plot
               temp1  = length(figure_handle.Children(p).Children);
               if temp1~=0
                   for k =1:1:temp1
                       if strcmpi( figure_handle.Children(p).Children(k).Type,'line') % maybe there are other children
                          figure_handle.Children(p).Children(k).LineWidth = 1; 
                       end
                   end   
               end
           end
        end
        % Finished dealing with Axes

        % Format legend
        number_of_legend = 0;
        for p = 1:1:number_of_children % Not used
            if strcmpi(figure_handle.Children(p).Type,'Legend')
                number_of_legend = number_of_legend + 1; 
            end
        end
        % legend formatting
        for p = 1:1:number_of_children
            if strcmpi(figure_handle.Children(p).Type,'Legend')    
               figure_handle.Children(p).FontName = 'Times New Roman';
               figure_handle.Children(p).FontSize = 8;
               figure_handle.Children(p).Units = 'centimeters';
               figure_handle.Children(p).Interpreter = 'latex';
               figure_handle.Children(p).Location = 'eastoutside';
               figure_handle.Children(p).Box = 'off';
               figure_handle.Children(p).ItemTokenSize = [10 1];
               figure_handle.Children(p).NumColumns = 1;
            end
        end 
    end
    
    % Adjust the figure when there is title or xlabel
    number_of_xlabel_and_title = 0;
    total_height  = 0;
    for p = 1:1:number_of_children   % Find number of xlabel + title
        if strcmpi(figure_handle.Children(p).Type,'axes')
            if ~isempty(figure_handle.Children(p).XLabel.String)
                number_of_xlabel_and_title = number_of_xlabel_and_title + 1;
                total_height = total_height + figure_handle.Children(p).TightInset(2);
            end
            if ~isempty(figure_handle.Children(p).Title.String)
                number_of_xlabel_and_title = number_of_xlabel_and_title + 1;
                total_height = total_height + figure_handle.Children(p).TightInset(4);
            end
        end
    end
    
       axes_index = 0;
       axes_height = zeros(1,number_of_axes);
       row_height  = zeros(1,number_of_rows);
       for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               axes_index = axes_index + 1;
               figure_handle.Children(p).Units = 'centimeter';
               axes_height(axes_index) = figure_handle.Children(p).OuterPosition(4);
           end 
       end  
% edit this for multiple rows of figures
%      
       axes_index   = 0;

       for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               figure_handle.Children(p).Units = 'centimeters';
               
               axes_index   = axes_index + 1; 
               
               column_index = number_of_columns - mod(axes_index,number_of_columns);
               % 
               row_index = ceil(axes_index/number_of_columns);
               
               % positioin of every subfigure
              
                if row_index == 1
                   distance_to_bot = 0;
               else
                   distance_to_bot = sum(axes_height(1:(row_index-1)*number_of_columns))/number_of_columns; 
               end
               
               figure_handle.Children(p).OuterPosition(2) = distance_to_bot;
             
               
               distance_to_left = (number_of_columns-column_index)*8 + 1.5;
               figure_handle.Children(p).Position(1) = distance_to_left;
               axes_index
              
  
               
          
           end
       end  
       % Adjust the whole size
        total_height = sum(axes_height(1:end)/number_of_columns)
       figure_handle.Position(4) = sum(total_height); 
       
       
       % 
        for p = 1:1:number_of_children
           if strcmpi(figure_handle.Children(p).Type,'axes')
               figure_handle.Children(p).Position(3) = 6.5;
           end
        end
        
       
        
                % legend formatting
%         for p = 1:1:number_of_children
%             if strcmpi(figure_handle.Children(p).Type,'Axes')    
%                x_position_axes = figure_handle.Children(p).Position(1); 
%             end
%         end 
%         % adjustment of legend position from the edge of the axes
%         for p = 1:1:number_of_children
%             if strcmpi(figure_handle.Children(p).Type,'Legend')    
%                figure_handle.Children(p).Position(1) = x_position_axes + 6.5;
%             end
%         end 
 
end