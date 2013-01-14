#############################
#gnuplot用スクリプトファイル#
#############################
#
#通常
set nolog y
set format y "%g" 
#片対数(y軸)
set log y
set format y "10^{%L}"
#
#画像サイズ
set size 0.7, 0.7
#
#範囲設定
set xr [:]
set yr [:]
#
#軸名称
set xl ""
set yl ""
#
#凡例の場所
set key rig bot
#
#プロット
pl "" u : w l ti ""
#error bar
pl "" u :: w ye ti ""
#
#eps出力
#モノクロ
set ter pos eps enh
#カラー
set ter pos eps enh color solid
set out ".eps"
repl
#
set ter wxt
set ter windows
set ter x11
