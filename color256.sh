#!/bin/sh
# filename:     color.sh
# author:       Nivigor
# date:         2018-12-30 ; Initial release
# purpose:      View all 256 terminal colors
#

N=0; N2=52;
fg="\033[38;05;"; bg="\033[48;05;"; reset="\033[0m"

_head() {
  printf " "
  for i in $(seq 0 $1); do printf "%5d" $i; done
  printf "\n"
}
_head6() {
  printf " "
  for i in $(seq 0 5); do printf "%5d" $i; done
  printf "    "
  for i in $(seq 0 5); do printf "%5d" $i; done
  printf "\n"
}
_color() {
  printf "%3d" $N
  for i in $(seq 0 $1); do
    printf "$bg%dm     " $N; N=$((N+1))
  done
  printf "$reset\n"
}
_color6() {
  printf "%3d" $N
  for i in $(seq 0 5); do
    printf "$bg%dm     " $N; N=$((N+1))
  done
  printf "$reset%4d" $N2
  for i in $(seq 0 5); do
    printf "$bg%dm     " $N2; N2=$((N2+1))
  done
  printf "$reset\n"
}

clear
_head 7
for j in 0 1; do _color 7; done

for l in 0 1 2; do
  _head6
  for j in $(seq 0 5); do _color6; done
  N=$((N+36)); N2=$((N2+36))
done

_head 11
for j in 0 1; do _color 11; done
exit 0

