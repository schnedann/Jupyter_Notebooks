clear all;
close all;

fig=0
fg=1e4;
freq=linspace(0,1e6,2048);
Hre=1./(1.+(fg./freq).^2);

Him=(freq./fg)./(1.+(freq./fg).^2);

F=atan(freq./fg);

fig++;
figure(fig)
hold on
#semilogx(freq,Hre);
#semilogx(freq,Him);
loglog(freq,Hre,"-db");
loglog(freq,Him,":sr");
hold off
grid on;
title("High Pass Filter");
xlabel("Frequency");
ylabel("H");
legend("Real Part of H","Imaginary Part of H");

fig++;
figure(fig)
loglog(freq,F);
hold off
grid on;
title("High Pass Filter");
xlabel("Frequency");
ylabel("Phase");