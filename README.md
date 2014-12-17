dockerized-perl-app
===================

How to dockerized perl web application.

# Requirement

- Docker 1.0.0 or higher
- Boot2docker
- Fig

# Development

```shell
$ fig up
```

## Run each docker container

```shell
$ DB_NAME=$(fig run -d db)
$ fig run setup
$ fig run -p 5000:5000 -v ./:/src/app --links $DB_NAME web
```

## Run test

```shell
$ DB_NAME=$(fig run -d db)
$ fig run setup
$ fig run web script/test
```
