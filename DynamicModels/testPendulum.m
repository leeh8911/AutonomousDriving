pend = Pendulum;
pend = pend.create_();
pend.statusDisplay();

ini_theta = 30;
pend = Pendulum;
pend = pend.create_(ini_theta);
pend.statusDisplay();

ini_theta = 45;
ini_L = 10;
pend = Pendulum;
pend = pend.create_(ini_theta, ini_L);
pend.statusDisplay();