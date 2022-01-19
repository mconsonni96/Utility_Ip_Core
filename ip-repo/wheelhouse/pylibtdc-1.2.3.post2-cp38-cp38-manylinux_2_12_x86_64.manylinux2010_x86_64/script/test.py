

################################ Force DTC #####################################
# tdcModule.setProperty(tdcModule.FORCECALIBRATE, Channel, Value)
ValidNumTDL = 0
ValidPositionTap = 0
ch = 1
internal_chs(1, tdcModule)


############################# Read the counts ##################################

counter.setIntegrationTime(1)
sleep(3)
print(counter.getCounts())



########################## Valid Tuning ########################################

valid_tuning(ValidNumTDL, ValidPositionTap, tdcModule)
valid_tuning_ch(ValidNumTDL, ValidPositionTap, tdcModule, ch)


########################## Snif Calibration ####################################
show_cts(tdcModule)   





########################## HistoGram ####################################

def myHistCb_CDT(bins): 
	sum_bins = sum(bins)
	
	global mean
	mean = 0
	global std
	std = 0
	global hist
	hist = 0

	global dnl
	dnl = 0
	
	name="CDT_"+str(sum_bins)+".txt"
	with open(name,"w") as f:
		for x in bins:
			f.write(str(x)+"\n") 
		hist = bins

	print("Achived = ",sum_bins," Smp")
	print("Achived = ",sum_bins/len(bins)," Avg Smp") 


def myHistCb(bins): 
	sum_bins = sum(bins)
	
	global mean
	mean = 0
	global std
	std = 0
	global hist
	hist = 0
	
	if sum_bins > BINS_IN_HISTO: 
		with open("test.txt","w") as f:
			for x in bins:
				f.write(str(x)+"\n") 
				if x > 0: 
					print(x)
		hist = bins
		
	else: 
		print("Rec cb sum(bins)<",sum_bins,"we have",sum(bins)) 
		

	print("----------------------")
	mean =sum([i*(h/sum_bins) for i,h in enumerate(bins)])
	print("Mean Value [s] = ", mean*LSB)

	std =(sum([(h/sum_bins)*(i - mean)**2 for i,h in enumerate(bins)])**0.5)
	print("Dev Std [s rms] = ", std*LSB)
	print("----------------------")


histo=myBackend.getTDCHistogrammer()[0];
histo.getFSR()
histo.getBinW()
histo.getBitTrunc()
histo.getTimeOffset()

BINS_IN_HISTO = 1e6
LSB = histo.getBinW()
FSR = histo.getFSR();

histo.setAutoPush(True) 
histo.setCallback(myHistCb_CDT) 


histo.startIntegration()

histo.forcePush()


histo.pauseIntegration() 
histo.resetBinsCount()




t=np.arange(0,FSR,LSB)
h_m = sum(hist)/len(hist)
dnl=[((h/h_m) -1)*LSB for h in hist]
plt.plot(t*1e12, dnl)
plt.show()
	

std=sum([h**2 for h in dnl])**0.5




############ OSC PAnTher ############################
i2c_osc=myBackend.getLMK61E2()[0]




############ DAC PAnTher ############################
i2c_dac=myBackend.getIIC()[0]     
addr_left = 0x0C
addr_rigth = 0x0D

write_all_cmd = 0xB0

# Set 1 Volt of Threshold
i2c_dac.write(addr_left, write_all_cmd, pylibtdc.UInt32Vector([104,0]))








addr = bin2dec('xxxx');         % x = 0 or 1
data = bin2dec('xxxx xxxx');    % x = 0 or 1
a.gestIOPointer.sendDataToAddress.sendDataToAddress(addr,data);
%% I2C

% 1)----------------- FPGA DAC_I2C_DEBUG_MatLAB address -------------------
DAC_I2C_DEBUG_MatLAB = bin2dec('1001');	


% 2)------------------- I2C DAC Left and Right address --------------------

% DAC LEFT U7 Top Reference from CH1 to CH8 (SMA on the Left)
% DAC LEFT U7 Bottom Reference from CH9 to CH16 (SMA on the Right)

i2c_wr_addr_dac_left	= bin2dec('00001100');
i2c_wr_addr_dac_right	= bin2dec('00001101');


% 3)------------------ Byte Frasmitted in a I2C stram -------------------- 
i2c_byte_tx  = hex2dec('03');



% 4)------------------ Command + Address CH (NOT I2C!) --------------------

% COMMAND = ( C3 C2 C1 C0), ADDRESS CH = (A3 A2 A1 A0)


% Main Commands:
% C3 C2 C1 C0 
% 0  0  1  1        
% 1  0  1  1      

%Commands:
% C3 C2 C1 C0
% 0 0 0 0 No operation
% 0 0 0 1 Write to Input Register n (dependent on LDAC)
% 0 0 1 0 Update DAC Register n with contents of Input Register n
% 0 0 1 1 Write to and update DAC Channel n
% 0 1 0 0 Power down/power up DAC 0 1 0 1 Hardware LDAC mask register
% 0 1 1 0 Software reset (power-on reset)
% 0 1 1 1 Internal reference and gain setup register
% 1 0 0 0 Reserved
% 1 0 0 1 Reserved
% 1 0 1 0 Update all channels of input register simultaneously with the input data
% 1 0 1 1 Update all channels of DAC register and input register simultaneously with the input data
% 1 1 0 0 Reserved
%    
% 1 1 1 1 Reserved


% Address:                 Left DAC     Right DAC
% A3 A2 A1 A0              CH REF       CH REF
% 0  0  0  0     DAC 0     1            9
% 0  0  0  1     DAC 1     2            10
% 0  0  1  0     DAC 2     3            11
% 0  0  1  1     DAC 3     4            12
% 0  1  0  0     DAC 4     5            13
% 0  1  0  1     DAC 5     6            14
% 0  1  1  0     DAC 6     7            15
% 0  1  1  1     DAC 7     8            16
% others => NONE 

% i2c_command_dac_addr_tx = [( C3 C2 C1 C0),(A3 A2 A1 A0]
i2c_command_dac_addr_tx = bin2dec('10110000');


%5)------------------ Voltage Value in Two Byte to Send -------------------
% LSB = 2.5V/2^16
% the voltage value that you want V = dec2hex(V/LSB) =
% = i2c_MostSignificantByte_dac, i2c_LastSignificantByte_dac
i2c_MostSignificantByte_dac = hex2dec('30');
i2c_LastSignificantByte_dac = hex2dec('D4');



%6)----------------------- Package to Send via I2C-------------------------
Pacchetto_Dac_Left_I2C = [i2c_wr_addr_dac_left, i2c_byte_tx, i2c_command_dac_addr_tx ,i2c_MostSignificantByte_dac, i2c_LastSignificantByte_dac]
Pacchetto_Dac_Right_I2C = [i2c_wr_addr_dac_right, i2c_byte_tx, i2c_command_dac_addr_tx ,i2c_MostSignificantByte_dac, i2c_LastSignificantByte_dac]


%7)---------------------------- Sending via I2C----------------------------
a.gestIOPointer.sendDataToAddress(DAC_I2C_DEBUG_MatLAB,Pacchetto_Dac_Left_I2C);
a.gestIOPointer.sendDataToAddress(DAC_I2C_DEBUG_MatLAB,Pacchetto_Dac_Right_I2C);


%% Power UP

% Power UP Left DAC
PacchettoI2C_PuwerUP = [i2c_wr_addr_dac_left, i2c_byte_tx, bin2dec('01000000'),bin2dec('00000000'),bin2dec('00000000')];
a.gestIOPointer.sendDataToAddress(DAC_I2C_DEBUG_MAN,PacchettoI2C_PuwerUP);

% Power UP Right DAC
PacchettoI2C_PuwerUP = [i2c_wr_addr_dac_right, i2c_byte_tx, bin2dec('01000000'),bin2dec('00000000'),bin2dec('00000000')];
a.gestIOPointer.sendDataToAddress(DAC_I2C_DEBUG_MAN,PacchettoI2C_PuwerUP);


%% For Others Fx see the manual
