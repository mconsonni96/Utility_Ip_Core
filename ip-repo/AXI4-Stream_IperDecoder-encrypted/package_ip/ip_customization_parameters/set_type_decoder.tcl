# Decoder based on DecoLog2 or DecoT2B
# TYPE_DECODER	:	STRING			:= "T2B";

# ---------------- TYPE_DECODER ----------------
set LIST_TYPE_DECODER {T2B LOG}
set DEFAULT_TYPE_DECODER "T2B"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose the type of the sub-module that do the decoding, thermo-to-binary (T2B) or log2 (LOG)"
set display_name "Thermo-to-Binary vs Log2 Decoder"

set_param_string_list "TYPE_DECODER" $LIST_TYPE_DECODER $DEFAULT_TYPE_DECODER $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
