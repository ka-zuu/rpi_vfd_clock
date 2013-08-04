#!/bin/ksh


# GPIO初期設定

#G1
gpio -g mode 14 out
#G2
gpio -g mode 15 out
#G3
gpio -g mode 18 out
#G4
gpio -g mode 23 out
#G5
gpio -g mode 24 out
#G6
gpio -g mode 25 out

#a
gpio -g mode 2 out
#b
gpio -g mode 3 out
#c
gpio -g mode 4 out
#d
gpio -g mode 17 out
#e
gpio -g mode 27 out
#f
gpio -g mode 22 out
#g
gpio -g mode 10 out
#dp
gpio -g mode 9 out
#-
gpio -g mode 11 out


# 数字を出力するfunctionを組む
seg7_decode () {
  case $1 in
    "0" )
      gpio -g write 2  1
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 1
      gpio -g write 27 1
      gpio -g write 22 1
      gpio -g write 10 0
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "1" )
      gpio -g write 2  0
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 0
      gpio -g write 27 0
      gpio -g write 22 0
      gpio -g write 10 0
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "2" )
      gpio -g write 2  1
      gpio -g write 3  1
      gpio -g write 4  0
      gpio -g write 17 1
      gpio -g write 27 1
      gpio -g write 22 0
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "3" )
      gpio -g write 2  1
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 1
      gpio -g write 27 0
      gpio -g write 22 0
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "4" )
      gpio -g write 2  0
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 0
      gpio -g write 27 0
      gpio -g write 22 1
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "5" )
      gpio -g write 2  1
      gpio -g write 3  0
      gpio -g write 4  1
      gpio -g write 17 1
      gpio -g write 27 0
      gpio -g write 22 1
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "6" )
      gpio -g write 2  1
      gpio -g write 3  0
      gpio -g write 4  1
      gpio -g write 17 1
      gpio -g write 27 1
      gpio -g write 22 1
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "7" )
      gpio -g write 2  1
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 0
      gpio -g write 27 0
      gpio -g write 22 0
      gpio -g write 10 0
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "8" )
      gpio -g write 2  1
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 1
      gpio -g write 27 1
      gpio -g write 22 0
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
      ;;
    "9" )
      gpio -g write 2  1
      gpio -g write 3  1
      gpio -g write 4  1
      gpio -g write 17 1
      gpio -g write 27 0
      gpio -g write 22 1
      gpio -g write 10 1
      gpio -g write 9  0
      gpio -g write 11 0
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
    gpio -g write 15 1
    gpio -g write 15 0
    # G3
    seg7_decode ${now:2:1}
    gpio -g write 18 1
    gpio -g write 18 0
    # G4
    seg7_decode ${now:1:1}
    gpio -g write 23 1
    gpio -g write 23 0
    # G5
    seg7_decode ${now:0:1}
    gpio -g write 24 1
    gpio -g write 24 0
done


#  seg7_decode 8
#  echo 1 > $g6
