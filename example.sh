#!/bin/zsh

# Include our logging script
source ./includes/logging.sh

# Script entry (run as early as possible after include)
SCRIPTENTRY

#############################################################
# Dummy functions
#############################################################

function DIG_PIRATE_GOLD() {
  ENTRY   # We add "ENTRY" in top of every function

  INFO    "Digging for pirate gold..."
  DEBUG   "Searching on island: Hisingen"
  
  sleep 2

  WARN    "This is taking a longer time than expected..."
  SUCCESS "We successfully got some pirate gold!"

  EXIT  # We add "EXIT" in end of every function
}

function GET_HOSTNAME() {
  ENTRY   # We add "ENTRY" in top of every function

  INFO    "Getting hosting..."
  INFO    "Hostname is: $(hostname)"

  EXIT  # We add "EXIT" in end of every function
}

#############################################################
# Main script
#############################################################
INFO      "Starting program"
DIG_PIRATE_GOLD
GET_HOSTNAME
ERROR      "I'm done but I'm going to show an error instead"

# Script exit (run as late as possible in the script)
SCRIPTEXIT