# dotfiles

## How to use

### Configure bitwarden cli

1. Install cli

```bash
sudo pacman -S bitwarden-cli
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
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply afranioce
```
