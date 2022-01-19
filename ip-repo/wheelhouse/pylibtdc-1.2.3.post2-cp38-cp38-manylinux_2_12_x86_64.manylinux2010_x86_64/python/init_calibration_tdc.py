
# libraries
from time import sleep

import pylibtdc

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np



# handler
myBackend = pylibtdc.TDCBackend()
devices = myBackend.getDevices()


# obtain device list (element zero) and interface list (element one)
devs, ifaces = myBackend.getDevices()
print("I've loaded the following interfaces: ")
for x in ifaces:
    print(x)
print("")
print("I've found the followin devices: ")
for n in range(0, len(devs)):
    print(f"*------------ Device n. {n:2d} ------------*")
    for key in devs[n]:
        print(f"{key:20s}: {devs[n][key]}")
    print("")


# select and connect to device
devIndex = int(input("Insert device n.> "))
print(f"Connecting to device {devIndex:d}")
myBackend.open(devs[devIndex], {"baudrate":"2000000"})


# open backend TDC
myBackend.loadModules()

# TDC
tdcModule = myBackend.getTDC()[0]
counter = myBackend.getTDCCounter()[0]






# Show CT    
def show_cts(tdcModule):

	ct = []
	bin = []
	for ch_id in range(tdcModule.ch_num):
		
		tdcModule.save_calibration_data(tdcModule.CT, ch_id, "ch"+str(ch_id))
		ct_tmp = pd.read_csv(r"ch"+str(ch_id)+"_CT.csv")
		ct_tmp = ct_tmp/np.sum(ct_tmp)*(1e12*tdcModule.period)
		ct.append(ct_tmp);
		
		bin_tmp = list(range(1,len(ct_tmp)+1));
		bin.append(bin_tmp)


	fig, axs = plt.subplots(tdcModule.ch_num)
	fig.suptitle('Calibration Table')
	for ch_id in range(tdcModule.ch_num):
		axs[ch_id].plot(bin[ch_id], ct[ch_id])
		#axs[ch_id].ylabel('ps')
		#axs[ch_id].xlabel('bins')	


	
#	plt.plot(bin[0], ct[0], bin[1], ct[1], bin[2], ct[2])  
#	plt.ylabel('ps')
#	plt.xlabel('bins')
	plt.show()




	
# Set Reset internal ch	
def internal_chs(on_off, tdcModule):
		
	for ch_id in range(tdcModule.ch_num):
		tdcModule.setProperty(tdcModule.FORCECALIBRATE, ch_id, on_off)

