import sys
sys.path.append("/home/enrico/tmp/temp/pylibtdc/build/")

import pylibtdc
import pylibcia

from threading import Thread
from queue import Queue

# Create the backend object ("mb" stands for "myBackend")
mb = pylibtdc.TDCBackend()
mc = mb.getCiaHandler()

# Get device list
devices, interfaces = mb.getDevices()

print("I've loaded the following drivers:", ",".join(interfaces))

# List the devices to the user
i = 0
for x in devices:
    print(i, x)
    i += 1

# Ask the user the device to connect to, and open it
# The "baudrate" option is safely ignored by non-serial devices
mb.open(devices[int(input("> "))], {"baudrate" : "2000000"})

# Load the modules from hardware
mb.loadModules()

ts_list = []

class TTM_Decoder:
    def __init__(self, TDC_LSB):
        self.q = Queue()
        self.TDC_LSB = TDC_LSB
        
        self.remaining_header_words = 0
        self.remaining_payload_words = 0
        
        self.current_ts_base = 0
        
        self.PARTIAL_TS_WIDTH = 24
        
        self.t = Thread(target=self.decoder)
        self.t.daemon = True
        self.t.start()
        
    def data_callback(self, SID, data):
        print("PTE CALLBACK (pkt len: %d)" % len(data))
        for x in data:
            self.q.put(x)
        
    def decoder(self):
        while True:
            data = self.q.get()
            if self.remaining_payload_words == 0:
                self.remaining_payload_words = data & (2**24 - 1)
                #print("Begin of packet of %d words" % self.remaining_payload_words)
                self.remaining_header_words = 1 
                self.current_ts_base = data
            elif self.remaining_header_words == 1:
                #print("(header word)")
                self.current_ts_base |= data << 32
                self.remaining_payload_words -= 1
                self.remaining_header_words -= 1
                if self.remaining_header_words == 0:
                    self.current_ts_base >>= self.PARTIAL_TS_WIDTH
                    self.current_ts_base <<= self.PARTIAL_TS_WIDTH
            else:
                ch          = data >> self.PARTIAL_TS_WIDTH
                partial_ts  = data & (2**self.PARTIAL_TS_WIDTH - 1)
                ts          = data | self.current_ts_base
                self.remaining_payload_words -= 1
                #print("Received event: CH {} @ {:,.2f} ns".format(ch, ts * self.TDC_LSB * 1e9).replace(",","'"))
                ts_list.append([ch,ts * self.TDC_LSB])
                
dec = TTM_Decoder(2400e-12/(2**16))

mc.setStreamCallback(2,dec.data_callback)
