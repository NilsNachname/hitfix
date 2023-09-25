#!/bin/bash
set -e


install_drivers() {
    local WD="$(pwd)"

    local DRIVER
    ls "$WD/drivers/"\
        | while read DRIVER; do
            echo "Building driver $DRIVER"
            cd "$WD/drivers/$DRIVER/"
            exec "$WD/drivers/$DRIVER/install.sh"
            echo
        done
}


main() {
    install_drivers
}


main "$@"
