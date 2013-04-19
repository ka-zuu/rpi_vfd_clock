#!/bin/bash -xv


# GPIO初期設定

#G1
echo "14" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio14/direction
g1=/sys/class/gpio/gpio14/value
#G2
echo "15" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio15/direction
g2=/sys/class/gpio/gpio15/value
#G3
echo "18" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio18/direction
g3=/sys/class/gpio/gpio18/value
#G4
echo "23" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio23/direction
g4=/sys/class/gpio/gpio23/value
#G5
echo "24" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio24/direction
g5=/sys/class/gpio/gpio24/value
#G6
echo "25" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio25/direction
g6=/sys/class/gpio/gpio25/value

#a
echo "0" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio0/direction
ao=/sys/class/gpio/gpio0/value
#b
echo "1" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio1/direction
bo=/sys/class/gpio/gpio1/value
#c
echo "4" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio4/direction
co=/sys/class/gpio/gpio4/value
#d
echo "17" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio17/direction
do=/sys/class/gpio/gpio17/value
#e
echo "27" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio27/direction
eo=/sys/class/gpio/gpio27/value
#f
echo "22" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio22/direction
fo=/sys/class/gpio/gpio22/value
#g
echo "10" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio10/direction
go=/sys/class/gpio/gpio10/value
#dp
echo "9" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio9/direction
dp=/sys/class/gpio/gpio9/value
#-
#echo "11" > /sys/class/gpio/export
#echo "out" > /sys/class/gpio/gpio11/direction


# 数字を出力するfunctionを組む
function seg7_decode () {
  case $1 in
    "0" )
      echo 0 > $ao
      echo 0 > $bo
      echo 0 > $co
      echo 0 > $do
      echo 0 > $eo
      echo 0 > $fo
      echo 0 > $go
      echo 0 > $dp

      echo 1 > $g1
      echo 1 > $g2
      ;;
  esac
}

seg7_decode 0
