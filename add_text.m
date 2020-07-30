function y = add_text(x_coordinate,y_coordinate,the_text)
t = text(x_coordinate,y_coordinate,the_text);
t.Interpreter = 'Latex';
t.FontName    = 'Times New Roman';
t.FontSize    = 8;
t.Units = 'points';
t.HorizontalAlignment = 'center';
y = t;
end


