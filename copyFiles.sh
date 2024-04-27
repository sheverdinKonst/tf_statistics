#!/usr/bin/bash

#Copy Scripts to tf_pack
cp -r /home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/etc/tf_statistics/scripts/snmp/*.lua  /home/sheverdin/Fort_Telecom/t_fortis/t_fortis_pack/openwrt_tfortis_packages/tf_stat/files/etc/tf_statistics/scripts/snmp

#Copy lib to tf_pack

cp -r /home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/usr/share/lua/*.lua /home/sheverdin/Fort_Telecom/t_fortis/t_fortis_pack/openwrt_tfortis_packages/tf_stat/files/usr/share/lua

# copy to usr/local

cp -ruv /home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/usr/share/lua/*.lua  /usr/local/share/lua/5.3

cp /home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/usr/libexec/rpcd/hw_sensor.lua /home/sheverdin/Fort_Telecom/t_fortis/t_fortis_pack/openwrt_tfortis_packages/tf_stat/files/usr/libexec/rpcd/hw_sensor
cp /home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/usr/libexec/rpcd/ups_control.lua /home/sheverdin/Fort_Telecom/t_fortis/t_fortis_pack/openwrt_tfortis_packages/tf_stat/files/usr/libexec/rpcd/ups_control
cp /home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/usr/libexec/rpcd/autorestart.lua /home/sheverdin/Fort_Telecom/t_fortis/t_fortis_pack/openwrt_tfortis_packages/tf_stat/files/usr/libexec/rpcd/autorestart