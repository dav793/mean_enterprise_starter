# mean-enterprise-starter

## Build instructions

* clone this repo + client/server submodules
```bash
    git clone --recursive https://github.com/dav793/mean-enterprise-starter.git
```

* create server config file from template
```bash
    cp mean-enterprise-starter-server/config/config.template.json mean-enterprise-starter-server/config/config.json
```

* setup server config file ```mean-enterprise-starter-server/config/config.json```

* setup client environment file ```mean-enterprise-starter-client/src/environments/environment.ts```

* create docker env file
```bash
    touch .env
```

* setup docker env file
```bash
    ROOT_PATH=/Users/david/Workspace/mean-enterprise-starter
```

* run DB service only 
```bash
    docker-compose -f docker-compose.db.yml up
```

* set up initial database state (if not already set)
```bash
    mean-enterprise-starter-server/scripts/setupDb.sh -h localhost -d mean-enterprise-starter -u root -p example
```

* stop DB service

* [run](#run)

## <a name="run"></a> Run

### production:
```bash
    docker-compose -f docker-compose.production.yml up              // run
     
    docker-compose -f docker-compose.production.yml up --build      // run + force re-build
    
    docker-compose -f docker-compose.production.yml stop            // stop
```

### development:
```bash
    docker-compose -f docker-compose.development.yml up             // run
    
    docker-compose -f docker-compose.development.yml up --build     // run + force re-build
    
    docker-compose -f docker-compose.development.yml stop           // stop
```

## Run DB service only

```bash
    docker-compose -f docker-compose.db.yml up
```

## DB Users
### root
* User: `root`
* Password: `example`
* Has **all** permissions, everywhere.

### default user
* User: `mean-enterprise-starter`
* Password: `12345678`
* Has **all** permissions on DB `mean-enterprise-starter` only.

## Backup/restore DB

* Dump

```bash
    mongodump --host 127.0.0.1 --db mean-enterprise-starter -u root -p example --out ${PATH_TO_DUMP}
```

* Restore

```bash
    mongorestore --host 127.0.0.1 --db mean-enterprise-starter -u root -p example ${PATH_TO_DUMP}/mean-enterprise-starter
```

## Utilities

* open shell on server container

```bash
    docker exec -it mean-enterprise-starter_mean-enterprise-starter-server_1 bash
```

* create a container from an image and replace container startup routine with bash

```bash
    docker run -it --entrypoint /bin/bash mean-enterprise-starter_mean-enterprise-starter-server -s
```

* redirect stdout to log file
```bash
    ./redirectStdoutToLog.sh
```

* stop redirecting stdout to log file
```bash
    exit
```

* prepend timestamp to stdout
```bash
    <command> | ts '[%Y-%m-%d %H:%M:%S]'
```

* clear database
```bash
    mean-enterprise-starter-server/scripts/clearDb.sh -h localhost -d et-crm -u root -p example
```

* restart docker
```bash
    service docker restart
```

*
```bash
    sudo usermod -a -G docker $USER
```

