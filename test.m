clc
clear
close all
x = 0:0.1:2*pi;
y = sin(x);
figure
subplot(3,1,1);

plot(x,y,'r')
xlim([0 6])
subplot(3,1,2);

plot(x,y,'g')
hold on

plot(x,y+2,'k')
legend('a','b')
xlim([0 6])
subplot(3,1,3);

plot(x,y,'k')
xlim([0 6])
% xlabel('{a;time(s)}')
f = figure(1);
x_ticks_label_off(f)
x_label_subplot2(f);
format_figure(f,2)
y_label_subplot(f,{'a','b','c'})
