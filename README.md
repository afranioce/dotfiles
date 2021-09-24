# dotfiles

## How to use

### Configure bitwarden cli

1. Install cli

* For Arch linux

```bash
sudo pacman -S bitwarden-cli
```

* Ubuntu

```bash
wget -qO- https://github.com/bitwarden/cli/releases/download/v1.18.1/bw-linux-1.18.1.zip | sudo busybox unzip -d /usr/local/bin - && sudo chmod +x /usr/local/bin/bw
```

2. Then you can login to your account

```bash
$ bw login
? Email address: <your-email-address>
? Master password: [hidden]
You are logged in!
```

3. Unlock your Bitwarden vault:

```bash
bw unlock
```

4. Set the `BW_SESSION` environment variable, as instructed.

```bash
export BW_SESSION=<your-bitwarden-session-token>
```
### Download and apply chezmoi

```bash
$ sh -c "$(wget -qO- git.io/chezmoi)" -- init --apply afranioce
```
