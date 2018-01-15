# Backup databases

Command to backup databases and place in a timestamped directory.

## Environment Configuration

Use `--link <couchdb container name>:couchdb` to automatically specify the required variables.

Or alternatively specify the individual variables:

- `COUCHDB_HOST` = IP / hostname of CouchDB server (default `localhost`).
- `COUCHDB_PROTO` = http (default) or https
- `COUCHDB_PORT` = TCP Port of CouchDB service (default `5984`).
- `COUCHDB_USER` = Administrative user with appropriate privileges.
- `COUCHDB_PASS` = Password of administrative user.

### Environment Options

- `BACKUP_DIR` backup location

### Options

- `<databases>...` name of database(s) to backup. If not specified all databases will be dumped.

## Example

```
docker run --rm -t -i --link myserver:couchdb -e BACKUP_DIR=/data -v /mnt/backup:/data docker.io/panubo/couchdb-toolbox backup db1 db2
```
