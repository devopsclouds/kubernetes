#iia = 10##
#zsh: command not found: a
a=10
b=$(($a<0?10:$a<100))
echo $b

exit 0

