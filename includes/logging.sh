#!/bin/zsh
 
# Script log
SCRIPT_LOG_PATH="./logs"
SCRIPT_LOG_FILE="logger.log"

# Scripts log
SCRIPT_LOG=${SCRIPT_LOG_PATH}/${SCRIPT_LOG_FILE}

# Make directory and log file
mkdir -p "${SCRIPT_LOG_PATH}"
touch ${SCRIPT_LOG_PATH}/${SCRIPT_LOG_FILE}

function SCRIPTENTRY() {
 SCRIPT_NAME=$(basename "$0")
 SCRIPT_NAME="${SCRIPT_NAME%.*}"
 echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m> $SCRIPT_NAME ${funcstack[0]}\e[0m" | tee -a "$SCRIPT_LOG"
}
export SCRIPTENTRY

function SCRIPTEXIT() {
 SCRIPT_NAME=$(basename "$0")
 SCRIPT_NAME="${SCRIPT_NAME%.*}"
 echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m< $SCRIPT_NAME ${funcstack[0]}\e[0m" | tee -a "$SCRIPT_LOG"
}
export SCRIPTEXIT

function ENTRY() {
 echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m> ${funcstack[2]}\e[0m" | tee -a "$SCRIPT_LOG"
}
export ENTRY

function EXIT() {
 echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m< ${funcstack[2]}\e[0m" | tee -a "$SCRIPT_LOG"
}
export EXIT

function INFO() {
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
  
    echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;34;40m[INFO]\e[0m    $msg" | tee -a "$SCRIPT_LOG"
}
export INFO

function SUCCESS() {
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
  
    echo -e "\e[1;30;40m[$(date)]\e[0m \e[3;32;40m[SUCCESS]\e[0m $msg" | tee -a "$SCRIPT_LOG"
}
export SUCCESS

function WARN() {
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
  
 echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;33;40m[WARN]\e[0m    $msg" | tee -a "$SCRIPT_LOG"
}
export WARN

function DEBUG() {
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
  
 echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;35;40m[DEBUG]\e[0m   $msg" | tee -a "$SCRIPT_LOG"
}
export DEBUG

function ERROR() {
 local function_name="${FUNCNAME[1]}"
    local msg="$1"
  
    echo -e "\e[1;30;40m[$(date)]\e[0m \e[0;31;40m[ERROR]\e[0m   $msg" | tee -a "$SCRIPT_LOG"
}
export ERROR
