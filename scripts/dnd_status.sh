#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dnd_on_option_string="@dnd_on_icon"
dnd_off_option_string="@dnd_off_icon"

dnd_on_icon_osx="DND"
dnd_on_icon="DND"
dnd_off_icon_osx=""
dnd_off_icon=""

source $CURRENT_DIR/shared.sh

is_osx() {
  [ $(uname) == "Darwin" ]
}

is_dnd_installed() {
  [ -x "$(command -v do-not-disturb)" ]
}

dnd_on_icon_default() {
  if is_osx; then
    echo "$dnd_on_icon_osx"
  else
    echo "$dnd_on_icon"
  fi
}

dnd_off_icon_default() {
  if is_osx; then
    echo "$dnd_off_icon_osx"
  else
    echo "$dnd_off_icon"
  fi
}

dnd_status() {
  if is_dnd_installed; then
    status=$(do-not-disturb status)
    $([ "$status" == "on" ] && true || false)
  fi
}

print_icon() {
  if $(dnd_status); then
    printf "$(get_tmux_option "$dnd_on_option_string" "$(dnd_on_icon_default)")"
  else
    printf "$(get_tmux_option "$dnd_off_option_string" "$(dnd_off_icon_default)")"
  fi

  $(dnd_status)
}

main() {
  print_icon
}
main
