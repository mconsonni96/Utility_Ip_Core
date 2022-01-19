

################################ Force DTC #####################################
# tdcModule.setProperty(tdcModule.FORCECALIBRATE, Channel, Value)
on_off = 0
internal_chs(1, tdcModule)


############################# Read the counts ##################################

counter.setIntegrationTime(1)
sleep(3)
print(counter.getCounts())


########################## Snif Calibration ####################################
show_cts(tdcModule)   

