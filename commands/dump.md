# Backup databases

Command to dump a database.

## Environment Configuration

Use `--link <couchdb container name>:link` to automatically specify the required variables.

Or alternatively specify the individual variables:

- `COUCHDB_HOST` = IP / hostname of CouchDB server (default `localhost`).
- `COUCHDB_PROTO` = http (default) or https
- `COUCHDB_PORT` = TCP Port of CouchDB service (default `5984`).
- `COUCHDB_USER` = Administrative user with appropriate privileges.
- `COUCHDB_PASS` = Password of administrative user.

### Environment Options

- `DUMP_DIR` backup location

### Options

- `<databases>...` name of database(s) to dump.

## Example

```
docker run --rm -t -i --link myserver:link -e DUMP_DIR=/data -v /mnt/backup:/data docker.io/panubo/couchdb-toolbox dump db1 db2
```
