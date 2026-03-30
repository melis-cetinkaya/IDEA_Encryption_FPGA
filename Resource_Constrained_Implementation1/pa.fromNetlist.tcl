
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name idea_rcs1 -dir "/home/ise/VHDL_Lab_workspace/VHDL_System_Design_Lab/submit/rcs1/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/VHDL_Lab_workspace/VHDL_System_Design_Lab/submit/rcs1/idea_com.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/VHDL_Lab_workspace/VHDL_System_Design_Lab/submit/rcs1} }
set_property target_constrs_file "idea_hw.ucf" [current_fileset -constrset]
add_files [list {idea_hw.ucf}] -fileset [get_property constrset [current_run]]
link_design
