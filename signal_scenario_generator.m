%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Generate ADS5294 eigth channel signals from detector %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Datos del pulso
T2 = 4.5
Ts = 0.095
t = [0:Ts:1000];
samples = 3000
t_aux = [0:1:samples];
snr = 55

%datos del ADC
base_line = 0.01 % 10 mV
n_bits = 14
V_max = 1
V_min = -1
FS = V_max - V_min
q = FS/((2^14)-1)

%Trigger del IPCore
trigger = 0.25 %V = 250 mV
reset = 0.1 %V = 100 mV
trigger_D = ADC_out(trigger, q)
reset_D = ADC_out(reset, q)
y_lim = 0.5
y_lim_low = -0.1
x_offset = 420


%%%%%%%%%%%%%%%%% Channel 0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 0: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.1;
G2 = 0.9;
G3 = 1.42;
G4 = 0;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_0(i) = awgn(base_line, snr);
    else
        V_0(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_0(i) > 1;
            V_0(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_0(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_0(i) > 1;
            V_0(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_0(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_0(i) > 1;
            V_0(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_0(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_0(i) > 1;
            V_0(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_0(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_0(i) > 1;
            V_0(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_0(i) = ADC_out(V_0(i), q);
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 1: \n')

T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.09;
G2 = 0.81;
G3 = 1.45;
G4 = 0;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_1(i) = awgn(base_line, snr);
    else
        V_1(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_1(i) > 1;
            V_1(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_1(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_1(i) > 1;
            V_1(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_1(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_1(i) > 1;
            V_1(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_1(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_1(i) > 1;
            V_1(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_1(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_1(i) > 1;
            V_1(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_1(i) = ADC_out(V_1(i), q);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 2: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.09;
G2 = 0.77;
G3 = 1.55;
G4 = 0;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_2(i) = awgn(base_line, snr);
    else
        V_2(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_2(i) > 1;
            V_2(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_2(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_2(i) > 1;
            V_2(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_2(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_2(i) > 1;
            V_2(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_2(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_2(i) > 1;
            V_2(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_2(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_2(i) > 1;
            V_2(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_2(i) = ADC_out(V_2(i), q);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 3: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.08;
G2 = 0.8;
G3 = 1.65;
G4 = 0;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_3(i) = awgn(base_line, snr);
    else
        V_3(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_3(i) > 1;
            V_3(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_3(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_3(i) > 1;
            V_3(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_3(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_3(i) > 1;
            V_3(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_3(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_3(i) > 1;
            V_3(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_3(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_3(i) > 1;
            V_3(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_3(i) = ADC_out(V_3(i), q);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 4: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.52
G2 = 0.2;
G3 = 1.67;
G4 = 0.12;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_4(i) = awgn(base_line, snr);
    else
        V_4(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_4(i) > 1;
            V_4(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_4(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_4(i) > 1;
            V_4(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_4(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_4(i) > 1;
            V_4(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_4(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_4(i) > 1;
            V_4(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_4(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_4(i) > 1;
            V_4(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_4(i) = ADC_out(V_4(i), q);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 5: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.68;
G2 = 0.2;
G3 = 1.9;
G4 = 0.06;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_5(i) = awgn(base_line, snr);
    else
        V_5(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_5(i) > 1;
            V_5(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_5(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_5(i) > 1;
            V_5(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_5(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_5(i) > 1;
            V_5(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_5(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_5(i) > 1;
            V_5(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_5(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_5(i) > 1;
            V_5(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_5(i) = ADC_out(V_5(i), q);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 6: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.7;
G2 = 0.2;
G3 = 1.51;
G4 = 0.12;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_6(i) = awgn(base_line, snr);
    else
        V_6(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_6(i) > 1;
            V_6(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_6(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_6(i) > 1;
            V_6(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_6(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_6(i) > 1;
            V_6(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_6(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_6(i) > 1;
            V_6(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_6(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_6(i) > 1;
            V_6(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_6(i) = ADC_out(V_6(i), q);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Channel 7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Channel 7: \n')
T1 = 1.6 * T2;
T12 = 1.5 * T2;
T13 = 1.35 * T2;
T14 = 1.4 * T2;
T15 = T2;

G = 0.65;
G2 = 0.2;
G3 = 1.49;
G4 = 1.1;
G5 = 0;

j = 1;
k = 1;
n = 1;
m = 1;
z = 1;
for i = 1:length(t_aux)
    
    if i<=x_offset
        V_7(i) = awgn(base_line, snr);
    else
        V_7(i) = awgn((G*((T1 - T2)*((exp(-t(j)/T1))-(exp(-t(j)/T2))))) + base_line, snr);
        if V_7(i) > 1;
            V_7(i) = 1;
        end
        j=j+1;
    end
    
    if(i>x_offset + 700)
        V_7(i) = awgn((G2*((T12 - T2)*((exp(-t(k)/T12))-(exp(-t(k)/T2))))) + base_line, snr);
        if V_7(i) > 1;
            V_7(i) = 1;
        end
        k=k+1;
    end
    
    if(i>x_offset + 1250)
        V_7(i) = awgn((G3*((T13 - T2)*((exp(-t(n)/T13))-(exp(-t(n)/T2))))) + base_line, snr);
        if V_7(i) > 1;
            V_7(i) = 1;
        end
        n=n+1;
    end
    
    if(i>x_offset + 1900)
        V_7(i) = awgn((G4*((T14 - T2)*((exp(-t(m)/T14))-(exp(-t(m)/T2))))) + base_line, snr);
        if V_7(i) > 1;
            V_7(i) = 1;
        end
        m=m+1;
    end
    
    if(i>x_offset + 3000)
        V_7(i) = awgn((G5*((T15 - T2)*((exp(-t(z)/T15))-(exp(-t(z)/T2))))) + base_line, snr);
        if V_7(i) > 1;
            V_7(i) = 1;
        end
        z=z+1;
    end
    
    
    channel_7(i) = ADC_out(V_7(i), q);
    
 
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Plot signals and generate .h file %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%  Plot signals in V %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
ax0 = subplot(2,4,1);
plot(ax0,t_aux, V_0, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_0')
axis([0 samples y_lim_low y_lim])
ax1 = subplot(2,4,2);
plot(ax1,t_aux, V_1, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_1')
axis([0 samples y_lim_low y_lim])
ax2 = subplot(2,4,3);
plot(ax2,t_aux, V_2, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_2')
axis([0 samples y_lim_low y_lim])
ax3 = subplot(2,4,4);
plot(ax3,t_aux, V_3, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_3')
axis([0 samples y_lim_low y_lim])
ax4 = subplot(2,4,5);
plot(ax4,t_aux, V_4, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_4')
axis([0 samples y_lim_low y_lim])
ax5 = subplot(2,4,6);
plot(ax5,t_aux, V_5, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_5')
axis([0 samples y_lim_low y_lim])
ax6 = subplot(2,4,7);
plot(ax6,t_aux, V_6, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_6')
axis([0 samples y_lim_low y_lim])
ax7 = subplot(2,4,8);
plot(ax7,t_aux, V_7, 'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Voltage (V)')
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);
title('V_7')
axis([0 samples y_lim_low y_lim])
line([0;samples],[trigger;trigger],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset;reset],'color','b','linestyle','--','LineWidth',1.8);

%xlabel('time (s)')
%ylabel('Voltage (V)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Plot signals in ADC digital values %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);

ax0 = subplot(2,4,1);
plot(ax0,t_aux, channel_0, '.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 0')
axis([0 samples 7500 11500])
ax1 = subplot(2,4,2);
plot(ax1,t_aux, channel_1,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 1')
axis([0 samples 7500 11500])
ax2 = subplot(2,4,3);
plot(ax2,t_aux, channel_2,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 2')
axis([0 samples 7500 11500])
ax3 = subplot(2,4,4);
plot(ax3,t_aux, channel_3,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 3')
axis([0 samples 7500 11500])
ax4 = subplot(2,4,5);
plot(ax4,t_aux, channel_4,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 4')
axis([0 samples 7500 11500])
ax5 = subplot(2,4,6);
plot(ax5,t_aux, channel_5,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 5')
axis([0 samples 7500 11500])
ax6 = subplot(2,4,7);
plot(ax6,t_aux, channel_6,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 6')
axis([0 samples 7500 11500])
ax7 = subplot(2,4,8);
plot(ax7,t_aux, channel_7,'.k', 'LineWidth',0.1)
xlabel('sample')
ylabel('ADC value')
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);
title('channel 7')
axis([0 samples 7500 11500])
line([0;samples],[trigger_D;trigger_D],'color','r','linestyle','--','LineWidth',1.8);
line([0;samples],[reset_D;reset_D],'color','b','linestyle','--','LineWidth',1.8);


%%%%%%%%%%%%% generate .h file &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

matrix = [t_aux;channel_0;channel_1;channel_2;channel_3;channel_4;
    channel_5;channel_6;channel_7];

save('channels.mat','matrix');
mat2h('channels.mat','ch_0','ch_1','ch_2','ch_3','ch_4','ch_5','ch_6','ch_7');

fprintf("end: correctly generated signals\n")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% valores de pico 150.3
ch_0_1 = channel_0(400:900);
ch_1_1 = channel_1(400:900);
ch_2_1 = channel_2(400:900);
ch_3_1 = channel_3(400:900);
ch_4_1 = channel_4(400:900);
ch_5_1 = channel_5(400:900);
ch_6_1 = channel_6(400:900);
ch_7_1 = channel_7(400:900);

ch_0_2 = channel_0(1100:1400);
ch_1_2 = channel_1(1100:1400);
ch_2_2 = channel_2(1100:1400);
ch_3_2 = channel_3(1100:1400);
ch_4_2 = channel_4(1100:1400);
ch_5_2 = channel_5(1100:1400);
ch_6_2 = channel_6(1100:1400);
ch_7_2 = channel_7(1100:1400);

ch_0_3 = channel_0(1650:2000);
ch_1_3 = channel_1(1650:2000);
ch_2_3 = channel_2(1650:2000);
ch_3_3 = channel_3(1650:2000);
ch_4_3 = channel_4(1650:2000);
ch_5_3 = channel_5(1650:2000);
ch_6_3 = channel_6(1650:2000);
ch_7_3 = channel_7(1650:2000);

ch_0_4 = channel_0(2300:2600);
ch_1_4 = channel_1(2300:2600);
ch_2_4 = channel_2(2300:2600);
ch_3_4 = channel_3(2300:2600);
ch_4_4 = channel_4(2300:2600);
ch_5_4 = channel_5(2300:2600);
ch_6_4 = channel_6(2300:2600);
ch_7_4 = channel_7(2300:2600);

[max_ch_0_1, sample] = max(ch_0_1)
[max_ch_0_2, sample] = max(ch_0_2)
[max_ch_0_3 sample] = max(ch_0_3)
[max_ch_0_4 sample] = max(ch_0_4)

[max_ch_1_1 sample] = max(ch_1_1)
[max_ch_1_2, sample] = max(ch_1_2)
[max_ch_1_3 sample] = max(ch_1_3)
[max_ch_1_4 sample] = max(ch_1_4)

[max_ch_2_1 sample] = max(ch_2_1)
[max_ch_2_2, sample] = max(ch_2_2)
[max_ch_2_3 sample] = max(ch_2_3)
[max_ch_2_4 sample] = max(ch_2_4)

[max_ch_3_1 sample] = max(ch_3_1)
[max_ch_3_2, sample] = max(ch_3_2)
[max_ch_3_3 sample] = max(ch_3_3)
[max_ch_3_4 sample] = max(ch_3_4)

[max_ch_4_1 sample] = max(ch_4_1)
[max_ch_4_2, sample] = max(ch_4_2)
[max_ch_4_3 sample] = max(ch_4_3)
[max_ch_4_4 sample] = max(ch_4_4)

[max_ch_5_1 sample] = max(ch_5_1)
[max_ch_5_2, sample] = max(ch_5_2)
[max_ch_5_3 sample] = max(ch_5_3)
[max_ch_5_4 sample] = max(ch_5_4)

[max_ch_6_1 sample] = max(ch_6_1)
[max_ch_6_2, sample] = max(ch_6_2)
[max_ch_6_3 sample] = max(ch_6_3)
[max_ch_6_4 sample] = max(ch_6_4)

[max_ch_7_1 sample] = max(ch_7_1)
[max_ch_7_2, sample] = max(ch_7_2)
[max_ch_7_3 sample] = max(ch_7_3)
[max_ch_7_4 sample] = max(ch_7_4)

% calibration 130.5
max_noise_0 = max(channel_0(1:100))
min_noise_0 = min(channel_0(1:100))
mean_noise_0 = mean(channel_0(1:100))

max_noise_1 = max(channel_1(1:100))
min_noise_1 = min(channel_1(1:100))
mean_noise_1 = mean(channel_1(1:100))

max_noise_2 = max(channel_2(1:100))
min_noise_2 = min(channel_2(1:100))
mean_noise_2 = mean(channel_2(1:100))

max_noise_3 = max(channel_3(1:100))
min_noise_3 = min(channel_3(1:100))
mean_noise_3 = mean(channel_3(1:100))

max_noise_4 = max(channel_4(1:100))
min_noise_4 = min(channel_4(1:100))
mean_noise_4 = mean(channel_4(1:100))

max_noise_5 = max(channel_5(1:100))
min_noise_5 = min(channel_5(1:100))
mean_noise_5 = mean(channel_5(1:100))

max_noise_6 = max(channel_6(1:100))
min_noise_6 = min(channel_6(1:100))
mean_noise_6 = mean(channel_6(1:100))

max_noise_7 = max(channel_7(1:100))
min_noise_7 = min(channel_7(1:100))
mean_noise_7 = mean(channel_7(1:100))

function D = ADC_out(v_t, q)
    
    D = round((v_t + 1)/q);

end