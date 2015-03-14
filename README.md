# Galcon 2 Dump Scripts

##Information
[Official thread](http://www.galcon.com/forums/55/65/9654/)

## Usage
To download all logs to the current folder, simply run the script: `./g2dump.sh`

###Arguments
* `-f 2014-12-01` First log to download.
* `-t 2014-12-31` Last log to download.
* `-o ~/Downloads/` Directory to download to (with trailing slash!).
* `-s http://www.galcon.com/g2/logs/` Download from this url/mirror (with trailing slash!).

###Examples
`./g2dump.sh -f 2015-01-01 -t 2015-01-31` Download all logs from January 2015.
`./g2dump.sh -f 2015-01-01` Download all logs starting from 2015.
`./g2dump.sh -o /var/www/g2/logs/` Download all logs to `/var/www/g2/logs/`
`./g2dump.sh -s http://www.example.com/g2-logs-mirror/` Download all logs from the specified mirror instead of galcon.com.
