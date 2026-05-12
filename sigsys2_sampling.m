
fc = 8e3;   % till filtren
Wn = 2*pi*fc;
Rp = 3;

fs = 24000;             % samplingsfrekvens
t_kont = 0:1e-5:25e-3;  % första 25ms
t_dis = 0:1/fs:25e-3;
w = logspace(1,6,1000);   % rad/s


% intressanta signaler
x1 = 1*sin(2*pi*1000*t_kont);   % 1 (kHz)
x2 = 1*sin(2*pi*5000*t_kont);  % 5 
x3 = 1*sin(2*pi*8000*t_kont);  % 8 

% störningar
n1 = 1*sin(2*pi*11000*t_kont);   % 11
n2 = 1*sin(2*pi*12000*t_kont); % 18 

% analog insignal
x = n2;

% filter
% [b, a] = butter(12, Wn,'s');
[b, a] = cheby1(8, Rp, Wn, 's');

sys = tf(b, a);

% analog utsignal
y = lsim(sys, x, t_kont);

% diskret utsignal kollar vad y har för värden vid t_dis
y_dis = interp1(t_kont, y, t_dis);

% kolla ripple
figure
bode(sys)
grid on

figure
subplot(1,3,1)
plot(t_kont, x);
title('insignal')
xlabel('t (s)')
ylabel('U (V)')
axis([0 0.5e-3 -1 1])

subplot(1,3,2)
plot(t_kont,y);
title('utsignal kontinuerlig')
xlabel('t (s)')
ylabel('U (V)')
axis([0 5e-3 -1 1])

subplot(1,3,3)
stem(t_dis, y_dis);
title('utsignal diskret')
xlabel('t (s)')
ylabel('U (V)')
axis([0 5e-3 -1 1])




