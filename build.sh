#!/bin/bash
set -e


build_drivers() {
    local WD="$(pwd)"

    local DRIVER
    ls "$WD/drivers/"\
        | while read DRIVER; do
            echo "Building driver $DRIVER"
            cd "$WD/drivers/$DRIVER/"
            exec "$WD/drivers/$DRIVER/build.sh"
            echo
        done
}


main() {
    build_drivers
}


main "$@"
