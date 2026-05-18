#!/usr/bin/env zsh

# Script log (overridable via environment)
SCRIPT_LOG_PATH="${SCRIPT_LOG_PATH:-./logs}"
SCRIPT_LOG_FILE="${SCRIPT_LOG_FILE:-logger.log}"

# Scripts log
SCRIPT_LOG="${SCRIPT_LOG_PATH}/${SCRIPT_LOG_FILE}"

# Make directory and log file
mkdir -p "${SCRIPT_LOG_PATH}"
touch "${SCRIPT_LOG}"

function strip_ansi() {
    sed 's/\x1b\[[0-9;]*m//g'
}

function _log() {
    local color="$1"
    local level="$2"
    local msg="$3"
    local line
    line=$(printf "\e[2;37m[%s]\e[0m \e[%sm%-9s\e[0m %s" "$(date)" "$color" "[$level]" "$msg")
    printf '%s\n' "$line"
    printf '%s\n' "$line" | strip_ansi >> "$SCRIPT_LOG"
}

function SCRIPTENTRY() {
    SCRIPT_NAME=$(basename "$0")
    SCRIPT_NAME="${SCRIPT_NAME%.*}"
    _log "0;35;40" "DEBUG" "> $SCRIPT_NAME ${funcstack[1]}"
}

function SCRIPTEXIT() {
    SCRIPT_NAME=$(basename "$0")
    SCRIPT_NAME="${SCRIPT_NAME%.*}"
    _log "0;35;40" "DEBUG" "< $SCRIPT_NAME ${funcstack[1]}"
}

function ENTRY() {
    _log "0;35;40" "DEBUG" "> ${funcstack[2]}"
}

function EXIT() {
    _log "0;35;40" "DEBUG" "< ${funcstack[2]}"
}

function INFO() {
    _log "0;34;40" "INFO" "$1"
}

function SUCCESS() {
    _log "3;32;40" "SUCCESS" "$1"
}

function WARN() {
    _log "0;33;40" "WARN" "$1"
}

function DEBUG() {
    _log "0;35;40" "DEBUG" "$1"
}

function ERROR() {
    _log "0;31;40" "ERROR" "$1"
}
