#!/bin/zsh

# Include our logging script
source ./includes/logging.sh

# Script entry (run as early as possible after include)
SCRIPTENTRY

#############################################################
# Dummy functions
#############################################################

function SOMETHING_FANCY() {
  ENTRY

  INFO "Running something fancy..."
  sleep 2
  WARN "This is taking a longer time than expected"
  SUCCESS "We successfully ran something fancy..."

  EXIT
}

function GET_HOSTNAME() {
  ENTRY

  INFO "Getting hosting..."
  INFO "Hostname is: $(hostname)"

  EXIT
}

#############################################################
# Main script
#############################################################
INFO "Starting program"
SOMETHING_FANCY
GET_HOSTNAME
ERROR "I'm done but I'm going to show an error instead"

# Script exit (run as late as possible in the script)
SCRIPTEXIT