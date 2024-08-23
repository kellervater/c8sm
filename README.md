# c8sm
This repository contains a ready-to-use [devcontainer](https://containers.dev/) (tailored for VSCode),
which contains all the prerequisites to be able to skip Chapter 2 (basic tools installation) and 6 (start kind cluster) of the [C8SM Course](https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart).

If you're short on time, it provides a kickstart to get up and running fast whilst not polluting your own system with dependencies.

Also, there are scripts and make commands to to shortcut some of the course sections.

> [!NOTE]
> The container MAY also work with different IDEs than `VSCode`, as long as they support devcontainers.
> But The section "customizations.vscode.extensions" will definitely not. So for the best UX I'd recommend using VSCode.

# How to Use

## VSCode
Open the [Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette)(Windows: `Ctrl+Shift+P`) and start typing: ![alt text](img/image.png).

Hit `Enter` twice and let the magic happen!

In the end you'll find yourself in a ready to use devcontainer with all tools installed, required to complete the course.

## Other IDEs
tbd

## Structure
This repository contains a lot of helper scripts to get your local C8SM up and running fast.

When typing `make help` you'll be presented with something like this:
```make help
asdf-plugins                   DevCon Post-Create: Install asdf plugins
asdf-install                   DevCon Post-Create: Install tools with asdf
get-repos                      Chapter 2.7 - Clones/Pull all necessary repositories
tooling-config                 Chapter 2.8 - Adds helm repos & updates dependencies
start-minikube                 Chapter 6.1 - Starts Minikube Cluster
stop-minikube                  Chapter 6.1 - Stops Minikube Cluster
delete-minikube                Chapter 6.1 - Deletes Minikube Cluster
check-dns                      Chapter 7.1 - Sanity check as prerequisite for working ingresses
aio                            Install c8sm including all prerequisites
```

> [!NOTE]
> When you reach the respective chapters you can either follow the course and type everything yourself
> or use the corresponding `make` commands listed in the help section.

> [!IMPORTANT]
> Just make sure to skip Chapter 6 and replace it with `make start-minikube`.
> `kind` doesn't work well within such a container setup.

> [!CAUTION]
> This setup is only tested using devcontainers. If you run it natively, don't forget to run `asdf-plugins` and `asdf-install`. You also need to install minikube and docker yourself beforehands.

## Troubleshooting
### Port Forwardings
Per default the ports `80` and `443` should already be auto-forwarded.
If that's not the case (or forwardings magically get lost), you can lookup on [how to forward a port](https://code.visualstudio.com/docs/devcontainers/containers#_temporarily-forwarding-a-port).

## Todo's

* [ ] add pre-commit and config
* [ ] enable for renovate
* [ ] externalize base devcontainer
