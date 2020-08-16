to_folder
clc
clear
close all
x = 0:0.1:2*pi;
y = sin(x);
figure
subplot(4,2,1);
plot(x,y,'r')
xlim([0 6])

subplot(4,2,2);
plot(x,y,'g')
xlim([0 6])

subplot(4,2,3);
plot(x,y,'k')
xlim([0 6])

subplot(4,2,4);
plot(x,y,'r-')
hold on
plot(x,y,'k-')
legend('a','b')
xlim([0 6])

subplot(4,2,5);
plot(x,y,'k-')
xlim([0 6]);
xlabel('nice')

subplot(4,2,6);
plot(x,y,'g-')
xlabel('ass')
hold on
xlim([0 6])

subplot(4,2,8);
plot(x,y,'g-')
xlabel('ass')
hold on
xlim([0 6])

subplot(4,2,7);
plot(x,y,'g-')
xlabel('ass')
hold on
xlim([0 6])





% xlabel('{a;time(s)}')
f = figure(1);
% x_ticks_label_off(f)
% x_label_subplot2(f);
format_figure2(f,2)
y_label_subplot(f,{'a','b','c'})

n = number_of_axes(f);
% for i = 1:1:n
% f.Children(i).XLabel.String = num2str(i);
% end
