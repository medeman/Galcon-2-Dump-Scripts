# Galcon 2 Dump Scripts

## Information
[Official thread](http://www.galcon.com/forums/55/65/9654/)

## Usage
To download all logs to the current folder, simply run the script: `./g2dump.sh`

### Arguments
* `-f 2014-12-01` First log to download.
* `-t 2014-12-31` Last log to download.
* `-o ~/Downloads/` Directory to download to (with trailing slash!).
* `-s http://www.galcon.com/g2/logs/` Download from this url/mirror (with trailing slash!).
* `-c` Save a compressed `.tgz` copy of the log as well.
* `-x` Attempt to download a compressed `.tgz` version from the mirror and decompress it. The mirror needs to provide compressed logs. If a compressed version is not found, the uncompressed `.txt` will be downloaded instead.

### Examples
* `./g2dump.sh -f 2015-01-01 -t 2015-01-31` Download all logs from January 2015.
* `./g2dump.sh -f 2015-01-01` Download all logs starting from 2015.
* `./g2dump.sh -o /var/www/g2/logs/` Download all logs to `/var/www/g2/logs/`
* `./g2dump.sh -s http://www.example.com/g2-logs-mirror/` Download all logs from the specified mirror instead of galcon.com.
* `./g2dump.sh -c` Download all logs and compress them.
* `./g2dimp.sh -s http://www.example.com/g2-logs-mirror-with-compression/ -x` Download all logs in compressed form and extract them.
