f = 50;
N = 25;
T = 1/f;
omega = (2*pi)/T;
a0 = 1/2;

R = 1e3;
C = 1e-6;
R2 = 3.3e3;
R3 = 1e4;
G = 1;

t = 0:1e-5:1;

s = 0;
for n = 1:N-1
    s = s + (2/T)*(((-cos(n*pi))/(n*omega))+(1/(n*omega))).*sin((2*pi*n*t)/(T));
end

x = a0 + s;

H1 = tf([0 0 (-G^2)/(R^2*C^2)], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);
y = lsim(H1, x, t);

figure

plot(t,x)
axis([0 1/10 0 2])

figure
plot(t,y)
axis([0 1/10 -2 2])