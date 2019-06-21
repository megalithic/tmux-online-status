#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/shared.sh

is_osx() {
  [ $(uname) == "Darwin" ]
}

is_dnd_installed() {
  [ -x "$(command -v do-not-disturb)" ]
}

dnd_status_on() {
  if is_osx && is_dnd_installed; then
    status=$(do-not-disturb status)
    $([ "$status" == "on" ] && true || false)
  else
    false
  fi
}


online_info() {
  if is_osx; then
    wan=$(dig +short myip.opendns.com @resolver1.opendns.com)

    tun=""
    for i in {0..3}
    do
      [[ -n $(ifconfig utun$i >/dev/null 2>&1 | rg 'inet ') ]] && tun=$(ifconfig utun$i >/dev/null 2>&1 | rg 'inet ' | awk '{print "["$2"]"}')
    done

    lan=""
    for i in {0..8}
    do
      [[ -n $(ifconfig en$i >/dev/null 2>&1 | rg 'inet ') ]] && lan=$(ifconfig en$i >/dev/null 2>&1 | rg 'inet ' | awk '$2 ~ /^[[:blank:]]*192/ {print $2}')
    done

    [[ -n $wan ]] && wan="#[fg=brightblue]礪$wan"
    [[ -n $tun ]] && tun="#[fg=colour136]\uf982$tun"
    [[ -n $lan ]] && lan="#[fg=yellow] $lan"

    echo "$wan$tun $lan"
  fi
}

print_info() {
  if $(dnd_status_on); then
    printf ""
  else
    printf "$(online_info)"
  fi
}

main() {
  print_info
}
main
