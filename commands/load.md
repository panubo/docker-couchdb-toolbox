# Import Dumps

Command to import CouchDB dumps.

## Configuration

Use `--link <couchdb container name>:couchdb` to automatically specify the required variables.

Alternatively specify the individual variables:

- `COUCHDB_HOST` = IP / hostname of CouchDB server (default `localhost`).
- `COUCHDB_PROTO` = http (default) or https
- `COUCHDB_PORT` = TCP Port of CouchDB service (default `5984`).
- `COUCHDB_USER` = Administrative user with appropriate privileges.
- `COUCHDB_PASS` = Password of administrative user.

### Environment Options

- `DATA_SRC` = Data source. This is where your dumps are.

Requires the dumps to be mounted at `/data` (unless overriden) and named `<database>.sql.gz`.

This means the database will be created with a name that is derived from the import filename.

### Options

- `--no-delete-database` don't delete databases before loading dump

## Usage Example

```
docker run --rm -i -t -v /mnt/data00:/data -e COUCHDB_HOST=172.19.66.4 -e COUCHDB_USER=root -e COUCHDB_PASS=foo docker.io/panubo/couchdb-toolbox import
```
