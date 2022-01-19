# MacroDecoder (MD) vs TurboDecoder (TD)
# MD_VS_TD		:	STRING			:= "TD";

# ------------------ MD_VS_TD -------------------
set LIST_MD_VS_TD {MD TD}
set DEFAULT_MD_VS_TD "MD"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose the modality for setting the paramiters of the Decoder, automatic (Turbo) or manual (Macro)"
set display_name "Macro vs Turbo Decoder"

set_param_string_list "MD_VS_TD" $LIST_MD_VS_TD $DEFAULT_MD_VS_TD $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
