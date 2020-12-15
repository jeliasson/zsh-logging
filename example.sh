#!/bin/zsh

# Include logging scripts
source ./includes/logging.sh

# Script entry
SCRIPTENTRY

# Dummy function
function SOMETHING_FANCY() {
  ENTRY

  INFO "Running something fancy..."
  sleep 2
  WARN "This is taking a longer time than expected"
  SUCCESS "We successfully ran something fancy..."

  EXIT
}

# Dummy function
function GET_HOSTNAME() {
  ENTRY

  INFO "Getting hosting..."
  SUCCESS "Hostname is: $(hostname)"

  EXIT
}

# Our application
INFO "Starting program"
SOMETHING_FANCY
GET_HOSTNAME
ERROR "I'm done but I'm going to show an error instead"

# Script exit
SCRIPTEXIT