#!/bin/zsh

# Include our logging script
source ./includes/logging.sh

# Script entry (run as early as possible after include)
SCRIPTENTRY

#############################################################
# Dummy functions
#############################################################

function SOMETHING_FANCY() {
  ENTRY   # We add "ENTRY" in top of every function

  INFO "Running something fancy..."
  sleep 2
  WARN "This is taking a longer time than expected"
  SUCCESS "We successfully ran something fancy..."

  EXIT  # We add "EXIT" in end of every function
}

function GET_HOSTNAME() {
  ENTRY   # We add "ENTRY" in top of every function

  INFO "Getting hosting..."
  INFO "Hostname is: $(hostname)"

  EXIT  # We add "EXIT" in end of every function
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