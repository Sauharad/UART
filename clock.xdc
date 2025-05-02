# Define the differential clock input pins
set_property PACKAGE_PIN R3 [get_ports SYSCLK_P]
set_property PACKAGE_PIN P3 [get_ports SYSCLK_N]

# Set both pins to LVDS standard
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_N]

create_clock -period 32.55208 -name clk_MHz -waveform {0 16.27604} [get_ports SYSCLK_P]