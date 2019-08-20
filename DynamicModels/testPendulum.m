clear, clc, close all
fig = figure; hold on; grid on; box on;
ax = gca;

pend = Pendulum;
pend = pend.create_();
pend.statusDisplay();

pend = Pendulum;
pend = pend.create_(10);
pend.statusDisplay();

pend = Pendulum;
pend = pend.create_(10, 'start_position_x', 10, 'start_position_y', 3);
pend.statusDisplay();
pend = pend.getFigure(fig, ax);
pend.drawFigure();

pend2 = Pendulum;
pend2 = pend2.create_(10, 'theta', 90);
pend2.statusDisplay();
pend2 = pend2.getFigure(fig, ax);
pend2.drawFigure();

