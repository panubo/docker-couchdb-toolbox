# CouchDB Toolbox

A collection of CouchDB tools for automating common tasks in a Docker-centric way.

## Documentation

Documentation for each subcommand:

- [Dump](commands/dump.md)
- [Load](commands/load.md)

## Usage

Using Docker links to `couchdb` container:

```docker run --rm -i -t --link myserver:couchdb docker.io/panubo/couchdb-toolbox```

This will display the usage information.

```docker run --rm -i -t --link myserver:couchdb docker.io/panubo/couchdb-toolbox <subcommand>```

To run the subcommand.

## Configuration

Use `--link <couchdb container name>:couchdb` to automatically specify the required variables.

Or alternatively specify the variables:

- `COUCHDB_HOST` = IP / hostname of CouchDB server (default `localhost`).
- `COUCHDB_PROTO` = http (default) or https
- `COUCHDB_PORT` = TCP Port of CouchDB service (default `5984`).
- `COUCHDB_USER` = Administrative user with appropriate privileges.
- `COUCHDB_PASS` = Password of administrative user.

Some subcommands require additional environment parameters.

## Status

Experimental.
