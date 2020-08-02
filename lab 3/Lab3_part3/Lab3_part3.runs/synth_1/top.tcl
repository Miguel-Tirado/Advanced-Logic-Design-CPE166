# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir T:/Lab3_part3/Lab3_part3.cache/wt [current_project]
set_property parent.project_path T:/Lab3_part3/Lab3_part3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_cache_permissions disable [current_project]
read_vhdl -library xil_defaultlib {
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/calculator.vhd
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/clkdiv.vhd
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/displayer.vhd
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/fsm.vhd
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/lfsr.vhd
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/mux.vhd
  T:/Lab3_part3/Lab3_part3.srcs/sources_1/new/top.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc T:/Lab3_part3/Lab3_part3.srcs/constrs_1/new/pins.xdc
set_property used_in_implementation false [get_files T:/Lab3_part3/Lab3_part3.srcs/constrs_1/new/pins.xdc]


synth_design -top top -part xc7a100tcsg324-1


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }