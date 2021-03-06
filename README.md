# docker-mongo-with-config
Docker image that allows advance MongoDB configuration for replication, authentication, sharding etc.
Quick replicaset setup available through bash script.

### Usage ###
```
git clone https://github.com/Bysness/mongo-with-config.git
sudo sh docker-mongo-with-config/docker_mongo_replicaset_commands.sh
```
You can then test that the 6 mongo instances are running by doing
```
sudo docker ps
```
By default, replica set `alpha` operates on ports 26000-26002 and `beta` on 26003-26005. You can change the ports by modifying the config files in `repl_alpha` and `repl_beta`. 

To initialize the replicaset, follow the official MongoDB Replica Set documentation.

```
//connect to port 26000
rs.initiate( {
   _id : "alpha",
   members: [
      { _id: 0, host: "127.0.0.1:26000" },
      { _id: 1, host: "127.0.0.1:26001" },
      { _id: 2, host: "127.0.0.1:26002" }
   ]
});
```

```
//connect to port 26003
rs.initiate( {
   _id : "beta",
   members: [
      { _id: 0, host: "127.0.0.1:26003" },
      { _id: 1, host: "127.0.0.1:26004" },
      { _id: 2, host: "127.0.0.1:26005" }
   ]
});
```
You should substitute 127.0.0.1 with your local adapter IP or a hostname if you want to connect to it from another computer

### Prerequisites ###
1. Docker CE / EE
2. Any Linux OS

### Production Usage ###
The `docker_mongo_replicaset_commands.sh` file contains commands to create volumes, build images, and create a container with each of them having access to only one volume. The idea setup would be to run one docker image on one server, but not all of us can afford to have 6 servers from the start.

You should therefore modify this file to suit your needs. You can pass custom config file, data directory, and log directory paths to the Dockerfile through `--build-arg`. Please inspect the Dockerfile for accepted args.
