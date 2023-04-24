#!/bin/zsh
function prompt_my_cpu_temp(){
  if [ -e /sys/class/thermal/thermal_zone0/temp ]; then
    integer cpu_temp="$(cat /sys/class/thermal/thermal_zone0/temp) / 1000"
    if (( cpu_temp >=80 ))
    then 
      p10k segment -s HOT -f red -i '' -t "${cpu_temp}℃"
    elif (( cpu_temp >= 60 ))
    then
      p10k segment -s WARM -f yellow -i '' -t "${cpu_temp}℃"
    elif (( cpu_temp >= 40 ))
    then
      p10k segment -s WARM -f green -i '' -t "${cpu_temp}℃"
    fi
  fi
}
function prompt_my_cpu_rate(){
  rate=$( top -n 1|grep Cpu|awk '{print 100-$8}' )
  p10k segment -s RATE -f white -i '' -t "${rate}%%"
}
