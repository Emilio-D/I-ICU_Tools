import sys
import numpy as np
from pylab import *

q = 2/((2**14)-1)

def ADC_in(D_out):

    return round(D_out*q-1, 5) 

cont = 'c'

while cont == 'c':


    print()
    print("###################################################################################################################")
    print("#                                                                                                                 #")
    print("#  Telemetry ECSS-ST-70 AppData decoder valid for private telemetry 130 subtypes 2, 3, 4, 5 from I-ICU proyect    #")
    print("#                                                                                                                 #")
    print("#                (SRG-UAH // 2021)                                        Powered by Emilio Dominguez             #")
    print("#                                                                                                                 #")
    print("###################################################################################################################")
    print()
    print()
    
    data = input("Enter a 130 raw telemetry: ")
   

    TM_type = int(data[13:16], 16)
    TM_subtype = int(data[16:18], 16)


    if(TM_type != 130): # Check TM type

        while TM_type != 130:
        
            print("Error: TM type is different than 130, enter a correct 130 TM")
            data = input("Enter a telemetry: ")
            TM_type = int(data[13:16], 16)
            TM_subtype = int(data[16:18], 16)

    AppData = data[20:len(data)]
    AppDataSize = int(len(AppData)/2)

    timeLow = int(AppData[0:8], 16)
    timeHigh = int(AppData[8:12], 16)
    micro = timeLow & 0x3FF
    seg = (timeLow >> 10) & 0x3F
    minu = (timeLow >> 16) & 0x3F
    hour = (timeLow >> 22) & 0x3F
    day = (timeLow >> 27) & 0x1F
    mon = timeHigh & 0xF
    year = (timeHigh >> 4) & 0xFFF


    ##############################################################################################################################################


    if TM_subtype == 5: # TM 130.5 Calibrated report

        if(AppDataSize == 54):
            
            TM_name = "TM(130.5) Calibrate report / AppData = 54 bytes"
            k = 12
            base_level = []
            noise_margins = []
            for i in range(8):
                base_level.append(int(AppData[k:k+4], 16))
                k+=4;
 
            for i in range(8):
                noise_margins.append(int(AppData[k:k+8], 16))
                k+=8;
            
            
        else:
            print("  Error: AppData size of TM(130.5) entered different than 54 bytes")
            sys.exit()

            
    ##############################################################################################################################################
            

    elif TM_subtype == 2: # TM 130.2 Periodic statistics

        if(AppDataSize == 30):
            
            TM_name = "  TM(130.2) Periodic statistics report / AppData = 54 bytes"
            
            total_events = int(AppData[12:16], 16)
            full_events = int(AppData[16:20], 16)
            bottom_events = int(AppData[20:24], 16)
            top_events = int(AppData[24:28], 16)
            channels_statistics = []
            k = 28
            for i in range(8):
                channels_statistics.append(int(AppData[k:k+4], 16))
                k+=4;

        else:
            print("  Error: AppData size of TM(130.2) entered different than 30 bytes")
            sys.exit()


            
    ##############################################################################################################################################

            

    elif TM_subtype == 3: # TM 130.3 Pulse width
        
        if(AppDataSize == 39):
            
            TM_name = "  TM(130.3) Pulse width report / AppData = 39 bytes"
            
            peaks = []
            sample_num = []
            k = 12
            for i in range(8):
                peaks.append(int(AppData[k:k+4], 16))
                k+=4;
            for i in range(8):
                sample_num.append(int(AppData[k:k+4], 16))
                k+=4;
                
            coincidence_type = int(AppData[k:79], 16)

        else:
            print("  Error: AppData size of TM(130.2) entered different than 30 bytes")
            sys.exit()



    ##############################################################################################################################################

            

    elif TM_subtype == 4: # TM 130.4 Pulse shape

        FIFO_depth = int(AppData[18:22], 16)
        size = (FIFO_depth * 2) + 11

        if(AppDataSize == size):

            TM_name = "  TM(130.4) Pulse shape report / AppData = (depth*2)+11 bytes = " + str(size)

            channel = int(AppData[12:14], 16)
            FIFO_delay = int(AppData[14:18], 16)
            FIFO_depth = int(AppData[18:22], 16)
            samples_0 = []
            samples_1 = []
            samples_2 = []
            samples_3 = []
            samples_4 = []
            samples_5 = []
            samples_6 = []
            samples_7 = []
            samples_0_v = []
            samples_1_v = []
            samples_2_v = []
            samples_3_v = []
            samples_4_v = []
            samples_5_v = []
            samples_6_v = []
            samples_7_v = []

            k = 22
            for j in range(int(FIFO_depth)):
                samples_0.append(int(AppData[k:k+4], 16))
                samples_0_v.append(ADC_in(int(AppData[k:k+4], 16)))
                k+=4;

            for i in range(1,8):
   
                data = input(" Enter channel " + str(i) + " TM(130.4):")
                AppData = data[20:len(data)]
                AppDataSize = len(AppData)/2
                TM_type = int(data[13:16], 16)
                TM_subtype = int(data[16:18], 16)
                channel = int(AppData[12:14], 16)

                if TM_type == 130 and TM_subtype == 4 and channel == i:
                        
                    if channel == 1:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_1.append(int(AppData[k:k+4], 16))
                            samples_1_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;

                    elif channel == 2:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_2.append(int(AppData[k:k+4], 16))
                            samples_2_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;

                    elif channel == 3:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_3.append(int(AppData[k:k+4], 16))
                            samples_3_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;

                    elif channel == 4:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_4.append(int(AppData[k:k+4], 16))
                            samples_4_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;

                    elif channel == 5:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_5.append(int(AppData[k:k+4], 16))
                            samples_5_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;

                    elif channel == 6:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_6.append(int(AppData[k:k+4], 16))
                            samples_6_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;

                    elif channel == 7:

                        k = 22
                        for j in range(int(FIFO_depth)):
                            samples_7.append(int(AppData[k:k+4], 16))
                            samples_7_v.append(ADC_in(int(AppData[k:k+4], 16)))
                            k+=4;
                
                else:

                    print("  Error: is not a correct channel " + str(i) + " TM(130.4)")
                    sys.exit()

        else:
            print("  Error: AppData size of TM(130.4) entered (" + str(AppDataSize) + ") different than calculated size depending on depth reported value of the FIFO = " + str(FIFO_depth))
            sys.exit()

    ##############################################################################################################################################

    else:

        while (TM_subtype > 5 or TM_subtype < 2):
        
            print("  Error: TM subtype is not valid, enter a correct 130 TM (2,3,4,5)")
            data = input(" Enter a telemetry: ")
            TM_type = int(data[13:16], 16)
            TM_subtype = int(data[16:18], 16)


    print("  Correct telemetry \n")
    print()
    print("  decoding... \n")
    print("__________________________________________________________________________________________________________________________________")
    print()
    print("  TM Type: ", TM_type)
    print("  TM Subtype: ", TM_subtype)
    print()
    print(TM_name)

    print("__________________________________________________________________________________________________________________________________")
    print()

    print("  time stamp =  " + str(micro) + ":" + str(seg) + ":" + str(minu) + ":" + str(hour) + " - " + str(day) + "/" + str(mon) + "/" + str(year))
    print()

    if TM_subtype == 5:
        
        for i in range(8):
            print("  base level channel " + str(i) + " .... " + str(base_level[i]) + " (" + str(ADC_in(base_level[i])) + " V)")

        print()

        for i in range(8):       
            print("  noise margins channel " + str(i) + " .... " + str(noise_margins[i] & 0xFFFF) + " to " + str((noise_margins[i] >> 16) & 0xFFFF) + " (" + str(ADC_in(noise_margins[i] & 0xFFFF)) + " to " + str(ADC_in((noise_margins[i] >> 16) & 0xFFFF)) + " V)" )


    if(TM_subtype == 2):

        print("  total events.... " + str(total_events))
        print("    full events..... " + str(full_events))
        print("    bottom events... " + str(bottom_events))
        print("    top events...... " + str(top_events))
        print()

        for i in range(8):
            print("  channel " + str(i) + " events.... " + str(channels_statistics[i]))


    if(TM_subtype == 3):

        print("  coincidence type... " + str(coincidence_type))
        print()
        print("----------------------------------------")
        for i in range(8):
            print("  peak channel " + str(i) + " .... " + str(peaks[i]) + " (" + str(ADC_in(peaks[i])) + " V)")
            print("    sample " + str(i) + " .... " + str(sample_num[i]))
            print("----------------------------------------")
        print("----------------------------------------")

    if(TM_subtype == 4):

        print("  FIFO depth... " + str(FIFO_depth))
        print("  FIFO delay... " + str(FIFO_delay))
            
        time = [i for i in range(len(samples_0))]
        trig = [10239 for i in range(len(samples_0))]
        trig_v = [ADC_in(10239) for i in range(len(samples_0))]

        figure(1)
        subplot(2,4,1)
        plot(time, samples_0, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        ylabel('ADC value [D]', fontsize=10)
        title("channel 0", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,2)
        plot(time, samples_1, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 1", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,3)
        plot(time, samples_2, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 2", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,4)
        plot(time, samples_3, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 3", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,5)
        plot(time, samples_4, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        ylabel('ADC value [D]', fontsize=10)
        title("channel 4", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,6)
        plot(time, samples_5, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 5", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,7)
        plot(time, samples_6, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 6", fontsize=10)
        ylim (8000,12000)

        subplot(2,4,8)
        plot(time, samples_7, 'mo', markersize = 0.5)
        plot(time, trig, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 7", fontsize=10)
        ylim (8000,12000)
        suptitle("TM(130.5) decoded data [D] @ " + "time stamp =  " + str(micro) + ":" + str(seg) + ":" + str(minu) + ":" + str(hour) + " - " + str(day) + "/" + str(mon) + "/" + str(year))

        ####### in volts @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

        figure(2)
        subplot(2,4,1)
        plot(time, samples_0_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        ylabel('V', fontsize=10)
        title("channel 0", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,2)
        plot(time, samples_1_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 1", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,3)
        plot(time, samples_2_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 2", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,4)
        plot(time, samples_3_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 3", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,5)
        plot(time, samples_4_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        ylabel('V', fontsize=10)
        title("channel 4", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,6)
        plot(time, samples_5_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 5", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,7)
        plot(time, samples_6_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 6", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))

        subplot(2,4,8)
        plot(time, samples_7_v, 'co', markersize = 0.5)
        plot(time, trig_v, 'k_', markersize = 1)
        xlabel('sample', fontsize=10)
        title("channel 7", fontsize=10)
        ylim (ADC_in(8000),ADC_in(12000))
        suptitle("TM(130.5) decoded data [V] @ " + "time stamp =  " + str(micro) + ":" + str(seg) + ":" + str(minu) + ":" + str(hour) + " - " + str(day) + "/" + str(mon) + "/" + str(year))

        show()


        
    print("__________________________________________________________________________________________________________________________________")
    print("__________________________________________________________________________________________________________________________________")
    print()
    print()

    print(" press 'c' to continue or 'x' to exit ")
    cont = input()
    
