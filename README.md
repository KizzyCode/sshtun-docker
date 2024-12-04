# kizzycode/sshtun
A tiny ssh-reverse-tunnel container-set.

## Setup
Create a server key and a client key using:
```sh
ssh-keygen -t ed25519 -f server-key
ssh-keygen -t ed25519 -f client-key
```

### Server Setup
Server setup is pretty straight forward:
1. Create an `authorized_keys` file, and add the client public key (`client-key.pub`)
2. Create a `host_key` file, and add the server private key (`server-key`)
3. Mount `authorized_keys` and `host_key` into `/mnt` within the container (UID 10000, permissions `u=rwX,g=,o=`)

See also [./server/example](./server/example) and [./docker-compose.yml](./docker-compose.yml).

## Client Setup
The client setup is a bit more complex, but also not difficult:
1. Create a `known_hosts` file, and add the server address and public key (`server-key.pub`)
2. Create a `host_key` file, and add the client private key (`client-key`)
3. Create a `config` file, and configure the server address, port and forwarding information
3. Mount `known_hosts`, `host_key` and `config` into `/mnt` within the container (UID 10000, permissions `u=rwX,g=,o=`)

See also [./client/example](./client/example) and [./docker-compose.yml](./docker-compose.yml).
