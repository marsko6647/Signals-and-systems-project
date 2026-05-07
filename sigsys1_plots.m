
R = 1e3;
C = 1e-6;
R2 = 1e2;
R3 = 1e6;
R4 = 1e3;
R5 = 1e3;
G = R5/R4;

H3 = tf([-1 0 0], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);
H2 = tf([0 (-G)/(R*C) 0], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);
H1 = tf([0 0 (-G^2)/(R^2*C^2)], [1 (R2*G)/(R3*R*C) (G^2)/(R^2*C^2)]);

    t = 0:1e-8:1e-2;
    h1 = impulse(H1,t);
    h2 = impulse(H2,t);
    h3 = impulse(H3,t);

figure
    subplot(1,3,1)
    plot(t, h1.^2);
    grid on
    title('H1')

    subplot(1,3,2)
    plot(t, h2.^2);
    grid on
    title('H2')

    subplot(1,3,3)
    plot(t, h3.^2);
    grid on
    title('H3')

figure
    subplot(1,3,1)
    pzplot(H1)
    grid on
    title('H1')

    subplot(1,3,2)
    pzplot(H2)
    grid on
    title('H2')

    subplot(1,3,3)
    pzplot(H3)
    grid on
    title('H3')

figure
    subplot(1,3,1)
    bode(H1)
    grid on
    title('H1')
    
    subplot(1,3,2)
    bode(H2)
    grid on
    title('H2')

    subplot(1,3,3)
    bode(H3)
    grid on
    title('H3')