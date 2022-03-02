# docker imap backup 

Simple Docker image that runs imap-backup with crontab and healthchecks.io integration.

## How to use

Checkout the documentation at [joeyates/imap-backup](https://github.com/joeyates/imap-backup#configuration-file) and create a config.json configuration file.

docker-compose.yml:
```yaml
---
version: "3.5"
services:
  imap-backup:
    image: ghcr.io/michaeldonovan/docker-imap-backup:master
    container_name: imap-backup
    environment:
      - HEALTHCHECK_URL=https://hc-ping.com/<uuid>  // OPTIONAL
      - SCHEDULE="* * * * *" // OPTIONAL
    volumes:
      - config.json:/root/.imap-backup/config.json:ro
      - <a local destination for backups>:<the path in imap-backup config file>
    restart: unless-stopped
```


## License

MIT
