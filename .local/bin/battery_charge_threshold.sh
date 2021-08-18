#!/bin/bash
echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
echo 40 | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold
