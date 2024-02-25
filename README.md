# dotcube - dotfiles management
## ZSH terminal configuration

Custom ZSH terminal configuration, currently supporting the following features:

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

- Apps
  - github-copilot-cli tool
  - networking related apps (optional)

### Installation and initial provisioning
Just copy-paste the following command in the terminal:

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/onexodus/dotcube/main/bin/dotcube)"

### Using dotcube and dotcube-remote
After the first provisioning you will have the `dotcube` and `dotcube-remote` commands available in the path.
Just running `dotcube` will update the system with latest version of the DOTCUBE repo/configuration.

#### Available options for `dotcube`
As `dotcube` is ultimatelly triggering the run of an ansible-playbook command, it's configured to support passing extra options to it.

All the roles in the ansible folder can be deployed using tags option `-t` and specifying the role name like in the following example:
    dotcube -t netops

By default, running the script will provision only the default `system` and `zsh` roles.

#### Other available roles:
Ugrade all the system packages
    dotcube -t upgrade

Install networking related tools
    dotcube -t netops

Install github-copilot-cli tool
    dotcube -t github-copilot-cli

#### dotcube-remote script
You can also use the `dotcube-remote` script to provision remote systems based on SSH access.
The script will check if it can login without password via SSH to remote host and otherwise it will copy local public key to authorized_keys on remote host.

Base deploy of `system` and `zsh` roles:
    dotcube-remote <remote-ip or hostname>

Tags are also supported:
    dotcube-remote <remote-ip or hostname> -t <tag>

If you need to specify the user to be used on the remote system (in case is different from local user):
    dotcube-remote <remote-ip or hostname> -u <user>

For deploying to multiple hosts you can create your own inventory file in yml format (outside of this repo) and use it instead of the remote ip/hostname like in the following example:
    dotcube-remote /path/to/inventory.yml
and with tags:
    dotcube-remote /path/to/inventory.yml -t upgrade


