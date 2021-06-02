#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
run VBoxClient-all
run picom -b --config ~/.config/picom/picom.conf
run ulauncher --hide-window
