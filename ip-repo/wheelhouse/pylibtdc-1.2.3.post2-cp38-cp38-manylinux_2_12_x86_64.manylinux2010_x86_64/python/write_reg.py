
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
#myIIC = myBackend.getIIC()[0]
#myIIC.write(0x44a40000,0x44a40000,pylibtdc.UInt32Vector([12,13]))


