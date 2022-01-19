
#!/bin/sh

# Go to source folder
SOURCES_PATH=$(pwd)
cd "$SOURCES_PATH"


#====================== LIST OF PACKAGE AND PATH COMPILING =====================

#----------- List of the Package and Path to Compile in Decoder ----------------
T2B_VHDL_FILE_LIST=("LocalPackage_T2B.vhd")
TA_VHDL_FILE_LIST=("LocalPackage_TA.vhd")

DECO_LOG2_VHDL_FILE_LIST=("AreaTimingPackage_DecoLog2.vhd" "LocalPackage_DecoLog2.vhd")
DECO_T2B_VHDL_FILE_LIST=("AreaTimingPackage_DecoT2B.vhd" "LocalPackage_DecoT2B.vhd")

TD_MD_VHDL_FILE_LIST=("LocalPackage_TD_MD.vhd")


DECODER_PATH_LIST=("/Log2Dn" "/Log2Up" "/ThermoToBin" "/TreeAdder" "/DecoLog2" "/DecoT2B" "/MacroDecoder" "/TurboDecoder" "/IperDecoder" )
#-------------------------------------------------------------------------------


#===============================================================================







#============================ GHDL COMPILING ===================================

#----------- Compile all Packager of Decoder in All subfolders -----------------
# For Each SubFodler of Decoder
for path in ${DECODER_PATH_LIST[*]}
do

	cd "$SOURCES_PATH"$path

	# LocalPackage_T2B
	for item in ${T2B_VHDL_FILE_LIST[*]}
	do
		ghdl -a --work=work "$SOURCES_PATH""/ThermoToBin/"$item
	done

	# LocalPackage_TA
	for item in ${TA_VHDL_FILE_LIST[*]}
	do
		ghdl -a --work=work "$SOURCES_PATH""/TreeAdder/"$item
	done

	# AreaTimingPackage_DecoLog2 LocalPackage_DecoLog2
	for item in ${DECO_LOG2_VHDL_FILE_LIST[*]}
	do
		ghdl -a --work=work "$SOURCES_PATH""/DecoLog2/"$item
	done

	# AreaTimingPackage_DecoT2B LocalPackage_DecoT2B
	for item in ${DECO_T2B_VHDL_FILE_LIST[*]}
	do
		ghdl -a --work=work "$SOURCES_PATH""/DecoT2B/"$item
	done

	# LocalPackage_TD_MD
	for item in ${TD_MD_VHDL_FILE_LIST[*]}
	do
		ghdl -a --work=work "$SOURCES_PATH""/"$item
	done

done

#-------------------------------------------------------------------------------



#===============================================================================
