#!/bin/ksh


# GPIO初期設定

#G1
echo "14" > /sys/class/gpio/unexport
echo "14" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio14/direction
g1=/sys/class/gpio/gpio14/value
#G2
echo "15" > /sys/class/gpio/unexport
echo "15" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio15/direction
g2=/sys/class/gpio/gpio15/value
#G3
echo "18" > /sys/class/gpio/unexport
echo "18" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio18/direction
g3=/sys/class/gpio/gpio18/value
#G4
echo "23" > /sys/class/gpio/unexport
echo "23" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio23/direction
g4=/sys/class/gpio/gpio23/value
#G5
echo "24" > /sys/class/gpio/unexport
echo "24" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio24/direction
g5=/sys/class/gpio/gpio24/value
#G6
echo "25" > /sys/class/gpio/unexport
echo "25" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio25/direction
g6=/sys/class/gpio/gpio25/value

#a
echo "2" > /sys/class/gpio/unexport
echo "2" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio2/direction
ao=/sys/class/gpio/gpio2/value
#b
echo "3" > /sys/class/gpio/unexport
echo "3" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio3/direction
bo=/sys/class/gpio/gpio3/value
#c
echo "4" > /sys/class/gpio/unexport
echo "4" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio4/direction
co=/sys/class/gpio/gpio4/value
#d
echo "17" > /sys/class/gpio/unexport
echo "17" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio17/direction
do=/sys/class/gpio/gpio17/value
#e
echo "27" > /sys/class/gpio/unexport
echo "27" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio27/direction
eo=/sys/class/gpio/gpio27/value
#f
echo "22" > /sys/class/gpio/unexport
echo "22" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio22/direction
fo=/sys/class/gpio/gpio22/value
#g
echo "10" > /sys/class/gpio/unexport
echo "10" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio10/direction
go=/sys/class/gpio/gpio10/value
#dp
echo "9" > /sys/class/gpio/unexport
echo "9" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio9/direction
dp=/sys/class/gpio/gpio9/value
#-
echo "11" > /sys/class/gpio/unexport
echo "11" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio11/direction
dsh=/sys/class/gpio/gpio11/value


# 数字を出力するfunctionを組む
seg7_decode () {
  case $1 in
    "0" )
      echo 1 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 1 > $do
      echo 1 > $eo
      echo 1 > $fo
      echo 0 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "1" )
      echo 0 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 0 > $do
      echo 0 > $eo
      echo 0 > $fo
      echo 0 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "2" )
      echo 1 > $ao
      echo 1 > $bo
      echo 0 > $co
      echo 1 > $do
      echo 1 > $eo
      echo 0 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "3" )
      echo 1 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 1 > $do
      echo 0 > $eo
      echo 0 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "4" )
      echo 0 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 0 > $do
      echo 0 > $eo
      echo 1 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 1 > $dsh
      ;;
    "5" )
      echo 1 > $ao
      echo 0 > $bo
      echo 1 > $co
      echo 1 > $do
      echo 0 > $eo
      echo 1 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "6" )
      echo 1 > $ao
      echo 0 > $bo
      echo 1 > $co
      echo 1 > $do
      echo 1 > $eo
      echo 1 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "7" )
      echo 1 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 0 > $do
      echo 0 > $eo
      echo 0 > $fo
      echo 0 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "8" )
      echo 1 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 1 > $do
      echo 1 > $eo
      echo 1 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
    "9" )
      echo 1 > $ao
      echo 1 > $bo
      echo 1 > $co
      echo 1 > $do
      echo 0 > $eo
      echo 1 > $fo
      echo 1 > $go
      echo 0 > $dp
      echo 0 > $dsh
      ;;
  esac
}


# メインループ
while : ; do
  # 現在時刻を取得
  now="$(date +%H%M)"

  
    # 時間を表示
    # G2
    seg7_decode ${now:3:1}
    echo 1 > $g2
    echo 0 > $g2
    # G3
    seg7_decode ${now:2:1}
    echo 1 > $g3
    echo 0 > $g3
    # G4
    seg7_decode ${now:1:1}
    echo 1 > $g4
    echo 0 > $g4
    # G5
    seg7_decode ${now:0:1}
    echo 1 > $g5
    echo 0 > $g5
done


#  seg7_decode 8
#  echo 1 > $g6
