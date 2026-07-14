## Ubuntu Sandbox for github-copilot

***How it works:*** An instance of Copilot CLI runs in rootless Docker container with controlled access to network and mounted volumes containing relevant context.

### Requirements
- Ubuntu Host System
- Rootless Docker
- Valid github-copilot Credentials

### Useful features

- Copilot Credentials and configs are saved in the external volume and survice the containers relaunch. You only need to setup once.
- Multiple instances can run simultaniously with several isolated Copilot sessions.
- By default, your ```$pwd``` is mounted as the external context volume into ```/workspace``` container path. So you can just ```cd``` to your workspace on your host machine and start working.

### Setup

```cd``` to ```copilot-sandbox``` and build docker image

```
docker build -t $USER/copilot-sandbox:latest .
```

Add copilot-sandbox to PATH

```
export PATH=$PATH:/$HOME/copilot-sandbox
```

Navigate to your project workspace direcroty with relevant sources and launch ```copilot-sandbox.sh```

This will run the Docker container and log you in. You should see this banner.

```
==========================================
Launching Copilot sandbox container
Project: <your project path>
==========================================

Inside the container, run 'copilot' to open the CLI.

root@copilot-sandbox:/workspace#
```

Run ```copilot``` and follow the usual Copilot CLI setup steps. You only need to setup once. After setup is done you can quit the container and relaunch as many instances as you need.

### Workflow

1. ```cd``` to you project workspace directory and run ```copilot-sandbox.sh```
2. Run ```copilot``` inside the container



### References

To setup Rootless Docker refer to the following tutorial [Sandbox your GitHub Copilot CLI on Linux](https://georg.dev/blog/07-sandbox-your-github-copilot-cli-on-linux/)
