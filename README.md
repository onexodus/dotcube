# dotcube | custom dotfiles management repo

Custom ZSH shell configuration, currently supporting the following features:

```yaml
- OS support:
  - ubuntu (debian)
  - osx
  - wsl on windows

- Prompt management:
  - starship (enabled by default)
  - pure

- Plugins:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-history-substring-search
  - zsh-autopair
  - zsh-completions
  - fzf

- Extras:
  - neofetch

- Apps:
  - networking related apps (optional)
```


### Installation and initial provisioning
Download and install `Hack Nerd Font` on your system:

[Download Hack Nerd Font from GitHub](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip)

Run the following command in the terminal:
```shell
bash -c "$(curl -fsSL https://raw.githubusercontent.com/onexodus/dotcube/main/bin/dotcube)"
```


### Using dotcube and dotcube-remote
After the first provisioning you will have the `dotcube` and `dotcube-remote` commands available in the path.
Just running `dotcube` will update the system with latest version of the DOTCUBE repo/configuration.



### Available options for `dotcube`
As `dotcube` is ultimately triggering the run of an ansible-playbook command, it's configured to support passing extra options to it.

All the roles in the ansible folder can be deployed using tags option `-t` and specifying the role name like in the following example:
```
dotcube -t netops
```
By default, running the script will provision only the default `system` and `zsh` roles when running for the first time then only the `zsh` role will be reprovisioned.



### Using specific role:
Run the base system role
```
dotcube -t system
```
Deploy the zsh configuration only
```
dotcube -t zsh
```
Ugrade all the system packages
```
dotcube -t upgrade
```
Install networking related tools
```
dotcube -t netops
```


### ZSH custom local config
Use the local `zsh-custom` file to add your extra custom configuration/source extra config files.
File location is `~/.config/zsh/zsh-custom`



## Remote deploy functionality - dotcube-remote script
Use the `dotcube-remote` script to provision remote systems based on SSH access.
The script will check if it can login without password via SSH to remote host and otherwise it will copy local public key to authorized_keys on remote host.

Base deploy of `system` and `zsh` roles:
```
dotcube-remote <IP or hostname>
```
Tags are also supported:
```
dotcube-remote <IP or hostname> -t <tag>
```
If you need to specify the user to be used on the remote system (in case is different from local user):
```
dotcube-remote <IP or hostname> -u <user>
```
For deploying to multiple hosts you can create your own inventory file in yml format (outside of this repo) and use it instead of the remote ip/hostname like in the following example:
```
dotcube-remote /path/to/inventory.yml
```
and with tags:
```
dotcube-remote /path/to/inventory.yml -t upgrade
```


### Debuging script errors

Add more verbosity to the script output using `-vv` or `-vvv`



### Rollback shell to original

To rollback the shell to the original use the `rollback` tag:
```
dotcube -t rollback
```

<!-- 
TODO: Remove role for rollback+delete everything
-->
