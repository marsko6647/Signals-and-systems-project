



R = 1;
C = 1;
R2 = 1;
R3 = 1;
R4 = 1;
R5 = 1;
G = R5/R4;

H3 = tf([-1 0 0], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);
H2 = tf([0 (-G)/(R*C) 0], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);
H1 = tf([0 0 (-G^2)/(R^2*C^2)], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);

figure
pzmap(H1)
grid on
axis equal

figure
pzmap(H2)
grid on
axis equal

figure
pzmap(H3)
grid on
axis equal