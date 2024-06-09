#!/bin/zsh

# Script log
SCRIPT_LOG_PATH="./logs"
SCRIPT_LOG_FILE="logger.log"

# Scripts log
SCRIPT_LOG=${SCRIPT_LOG_PATH}/${SCRIPT_LOG_FILE}

# Make directory and log file
mkdir -p "${SCRIPT_LOG_PATH}"
touch ${SCRIPT_LOG_PATH}/${SCRIPT_LOG_FILE}

function strip_ansi() {
    sed 's/\x1b\[[0-9;]*m//g'
}

function SCRIPTENTRY() {
    SCRIPT_NAME=$(basename "$0")
    SCRIPT_NAME="${SCRIPT_NAME%.*}"
    printf "\e[1;30;40m[%s]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m> %s %s\e[0m\n" "$(date)" "$SCRIPT_NAME" "${funcstack[0]}" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export SCRIPTENTRY

function SCRIPTEXIT() {
    SCRIPT_NAME=$(basename "$0")
    SCRIPT_NAME="${SCRIPT_NAME%.*}"
    printf "\e[1;30;40m[%s]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m< %s %s\e[0m\n" "$(date)" "$SCRIPT_NAME" "${funcstack[0]}" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export SCRIPTEXIT

function ENTRY() {
    printf "\e[1;30;40m[%s]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m> %s\e[0m\n" "$(date)" "${funcstack[2]}" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export ENTRY

function EXIT() {
    printf "\e[1;30;40m[%s]\e[0m \e[0;35;40m[DEBUG]\e[0m \e[1;30;40m< %s\e[0m\n" "$(date)" "${funcstack[2]}" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export EXIT

function INFO() {
    local function_name="${FUNCNAME[1]}"
    local msg="$1"
    printf "\e[1;30;40m[%s]\e[0m \e[0;34;40m[INFO]\e[0m    %s\n" "$(date)" "$msg" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export INFO

function SUCCESS() {
    local function_name="${FUNCNAME[1]}"
    local msg="$1"
    printf "\e[1;30;40m[%s]\e[0m \e[3;32;40m[SUCCESS]\e[0m %s\n" "$(date)" "$msg" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export SUCCESS

function WARN() {
    local function_name="${FUNCNAME[1]}"
    local msg="$1"
    printf "\e[1;30;40m[%s]\e[0m \e[0;33;40m[WARN]\e[0m    %s\n" "$(date)" "$msg" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export WARN

function DEBUG() {
    local function_name="${FUNCNAME[1]}"
    local msg="$1"
    printf "\e[1;30;40m[%s]\e[0m \e[0;35;40m[DEBUG]\e[0m   %s\n" "$(date)" "$msg" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export DEBUG

function ERROR() {
    local function_name="${FUNCNAME[1]}"
    local msg="$1"
    printf "\e[1;30;40m[%s]\e[0m \e[0;31;40m[ERROR]\e[0m   %s\n" "$(date)" "$msg" | tee  >(strip_ansi >> "$SCRIPT_LOG")
}
export ERROR
