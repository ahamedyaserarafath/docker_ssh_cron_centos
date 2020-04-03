# docker_ssh_cron_centos
This is a simple Docker file that shows how to run ssh and crond inside a CentOS docker container.

1. Add a file with your cron jobs (for example my file is root_cron) which will be copied inside the container.
2. Creating the SSH password which u can access using ip

Some commands for your reference
To build the Docker
```
docker build -t centos_ssh_cron .
```
Start the container
```
docker container run -it -p 2222:22 -d centos_ssh_cron
```
To get a container ip
```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
```
SSH command for docker
```
ssh root@<ip>
password -> secret@123
```

```
ssh anotheruser@<ip>
password -> secret@123
```
