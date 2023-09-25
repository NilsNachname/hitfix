#!/bin/bash
set -E
set -m


install() {
    local WD="$(pwd)"
    local PROGRAM_PATH="${WD}/driver/slabvcp.inf"
    
    echo "Creating temporary install handler"
    local INF_INSTALLER="$PRIVATE_PATH/install_inf.bat"
		echo "%SystemRoot%/System32/InfDefaultInstall.exe \"${PROGRAM_PATH}\""\
        | tee "$INF_INSTALLER"

    "$INF_INSTALLER"
}


main() {
    install
}


clean() {
    echo "Cleaning up"
    rm -rf "$PRIVATE_PATH"
}


PRIVATE_PATH="$(mktemp -d)"
trap clean EXIT
main "$@"
