function inc_brightness
	set current_brightness (cat /sys/class/backlight/intel_backlight/brightness)
	set new_brightness (math $current_brightness + 300)
	echo $new_brightness > /home/sam/.config/brightness
end
