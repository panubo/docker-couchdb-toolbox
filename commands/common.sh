#!/usr/bin/env bash

HOST=${COUCHDB_HOST-${COUCHDB_PORT_5984_TCP_ADDR-'localhost'}}
PORT=${COUCHDB_PORT-${COUCHDB_PORT_5984_TCP_PORT-'5984'}}
USER=${COUCHDB_USER-${COUCHDB_ENV_COUCHDB_USER-'admin'}}
PASS=${COUCHDB_PASS-${COUCHDB_ENV_COUCHDB_PASS}}
PROTO==${COUCHDB_PROTO-'http'}}
GZIP="gzip --fast"


function wait_couchdb {
    # Wait for CouchDB to be available
    TIMEOUT=${3:-30}
    echo -n "Waiting to connect to CouchDB at ${1-$HOST}:${2-$PORT}"
    for (( i=0;; i++ )); do
        if [ ${i} -eq ${TIMEOUT} ]; then
            echo " timeout!"
            exit 99
        fi
        sleep 1
        (exec 3<>/dev/tcp/${1-$HOST}/${2-$PORT}) &>/dev/null && break
        echo -n "."
    done
    echo " connected."
    exec 3>&-
    exec 3<&-
}

function genpasswd() {
    export LC_CTYPE=C  # Quiet tr warnings
    local l=$1
    [ "$l" == "" ] && l=16
    set +o pipefail
    strings < /dev/urandom | tr -dc A-Za-z0-9_ | head -c ${l}
    set -o pipefail
}
