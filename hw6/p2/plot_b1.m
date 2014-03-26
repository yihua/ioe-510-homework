clear
i = 1;
tmp = -20:0.1:20;
y1 = zeros(1,length(tmp));
y2 = zeros(1,length(tmp));
y3 = zeros(1,length(tmp));
for x=-20:0.1:20
    if x <= -13
        y1(i) = -12.8*x-48.4;
    elseif -13 < x && x <= -1
        y1(i) = -23/3*x+55/3;
    elseif x > -1
        y1(i) = 16*x + 42;
    end
    i = i + 1;
end
i=1;
for x=-20:0.1:20
    if x <= 0
        y2(i) = -8.75*x+40;
        y3(i) = -7*x+36;
    elseif 0 < x && x <= 6
        y2(i) = 9*x+40;
        y3(i) = x+36;
    elseif x > 6
        y2(i) = 10*x+34;
        y3(i) = 4*x/3 + 34;
    end
    i = i + 1;
end
x = -20:0.1:20;
set(findobj('FontSize',10),'FontSize',14);
set(gcf,'color','w');
plot(x,y1,'-b',x,y2,'--r',x,y3,'-.g', 'LineWidth', 2.5)
legend('b_1','b_2','b_3', 'Location', 'NorthWest')
xlabel('b_i')
ylabel('Objective value of (P)')
hold on
xd1 = [-13 -1];
yd1 = [118 26];
xd2 = [0 6];
yd2 = [40 94];
xd3 = [0 6];
yd3 = [36 42];
plot(xd1, yd1, 'bo', xd2, yd2, 'ro', xd3, yd3, 'go', 'MarkerSize', 6)
hold off