# Docker IDrive

Use iDrive with docker

## PREREQUISITES

- Docker and docker compose installed
- Own an account on IDrive.
- `make`

## Usage

- edit `volumes` section `docker-compose.yaml` and points desired backup directories to `/backup` inside the container
- `make build` (optional)
- `make init` enter your idrive credentials
- `make config` select menu item 1 and 2 and add directories
- `make backup` perform backups
- `make commit` since idrive stored config in files they will be lost on container restart, this command allows to persist them


## Credits

- https://github.com/baroka/idrive
