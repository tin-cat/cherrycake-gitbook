---
description: >-
  Set up a development environment with a skeleton "Hello world" Cherrycake web
  app to start working in just a few minutes using Docker.
---

# Docker start

{% hint style="warning" %}
Please note that the Cherrycake Docker project only runs in Linux. Should work in Mac Os too, but hasn't been tested yet.
{% endhint %}

First of all if you haven't done it before, [install Docker](https://docs.docker.com/get-docker).

Clone or [download](https://github.com/tin-cat/cherrycake-docker) the Cherrycake Docker project:

```bash
git clone https://github.com/tin-cat/cherrycake-docker.git CherrycakeAppDocker
```

Once in the Cherrycake Docker directory, use the  `cherrycake` script to interact with the docker project. Run `./cherrycake` without any argument to see a list of all the available commands:

```bash
./cherrycake
```

> Note that, depending on your Docker installation, you might need root privileges to run the `./cherrycake` script. In such cases, use `sudo ./cherrycake` instead.

To start the server, use the `start` command:

```bash
./cherrycake start
```

Once the initial build is complete, you'll have a working development environment ready:

* Access `http://localhost` on your browser to see the running app.
* Access `http://localhost:8080` to admin your database \(User `root`, no password\)
* Your Cherrycake app is stored under the `/app` directory, start working there!

