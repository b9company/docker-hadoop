# docker-hadoop

Dockerfile for [Apache Hadoop](https://hadoop.apache.org/)

Docker images built from this Dockerfile are available from
[Docker Hub](https://hub.docker.com/r/b9company/hadoop/)

## Usage

```
docker run -ti b9company/hadoop:2.9.0
```

## Image Information

This is no information pertaining to this section.

## Build Notes

The Docker image can be tailored through variables during the build process.
Note that `HADOOP_VERSION` is a required variable in order to specify which
Hadoop version to build.

| Build-time Variable | Description |
| ------------------- | ----------- |
| `HADOOP_VERSION`    | **Mandatory**. Hadoop version to build. |

To build `b9company/hadoop:2.9.0` Docker image, run:

```
make build HADOOP_VERSION=2.9.0
```
