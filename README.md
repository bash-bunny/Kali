# OVERVIEW

Personal configuration for a fresh Kali Linux to make it more useful with vim keybindings for the terminal and nice scripts to search the internet without leaving it

# Dependencies

- vim - for editing files
- tmux - for multiplexing the terminal
- cowsay, figlet, lolcat - For the super fancy timer

# Terminal

## Bash

I use bash as the default terminal instead of the zsh

### Configuration

- `~/.bashrc` - Default configuration file for bash with the vim mode on
- `~/.inputrc` - File configuration the look of the input depending on the vi mode we are
- `~/.config/aliasrc` - File with all the aliases

Changing the default shell in Kali Linux

```bash
chsh -s /usr/bin/bash
```

### Keybindings

#### Edit mode

- `Esc` - Exit edit mode and enter normal mode
- `Alt+k` - Exit edit mode and go back in history
- `Alt+j` - Exit edit mode and go forward in history

#### Normal mode

- `i` - Edit mode to write
- `k` - Go back in history
- `j` - Go forward in history
- `w` - Jump between words
- `/` - Search in history
- `A` - Enter edit mode at the end of the line
- `I` - Enter edit mode at the beggining of the line
- `ct<letter>` - Change until that letter and enter edit mode
- `C` - Change until the end of the line and enter edit mode

## Tmux

Terminal multiplexor that allows to be scripted and it's very flexible

### Installation

```bash
sudo apt install tmux
```

### Configuration

- `~/.tmux.conf` - Default file with the configuration for tmux with the default keybindings changed

### Keybindings

- `Ctrl+A` - Master combination to start introducing commands
- `Master+-` - Split horizontally
- `Master+_` - Split vertically
- `Master+c` - Create a new panel
- `Master+a` - Go between the last panel and the actual panel
- `Master+&` - Kill actual panel
- `Master+[` - Visual mode
  - `Space` - In visual mode select text
  - `Enter` - Copy the text selected and exit visual mode
- `Master+]` - Paste the buffer

## Vim

Default text editor via terminal, when it's acceded for the first time it would download the plugins if it's need it

### Installation

```bash
# Install vim
sudo apt install vim
# Install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Configuration

- `~/.vimrc` - Default file with all the configuration and look for the vim editor

## Lynx

Web browser via terminal, that allows you to search and navigate the WWW with only a terminal

### Installation

```bash
sudo apt install lynx
```

### Configuration

- `~/.config/lynx/lynx.cfg` - File with the configuration for lynx, all the keybindings, behavior, default browser to open, etc.
- `~/.config/lynx/lynx.lss` - File with the look configuration for lynx
- `~/.local/bin/lynx` - Wrapper for lynx to use our own configurations instead of the default one

### Keybindings

- `q` - Exit lynx
- `j` - Go down in every link in the web
- `k` - Go up in every link in the web
- `l` - Access the link
- `h` - Go back in history
- `i` - Information about the actual url
- `,` - Open in the default browse the actual url
- `/` - Search in the actual page

# Scripts

All the scripts that are on the PATH are stored in the folder `~/.local/bin/

- `lynx` - Wrapper for lynx
- `bing` - Script to search with bing using lynx
- `duck` - Script to search with duckduckgo using lynx
- `google` - Script to search with google using lynx
- `vic` - Script to open any file on the PATH with vim without going to that location
- `ix` - Script to share content using the web ix.io
- `urlencode` - Script to encode the requests for the `duck`, `bing` and `google` scripts
- `path` - Script to show the PATH in a pretty way
- `sharekeys` - To share the keys you are pressing in the screen

# Folders

- `~/.local/bin` - Folder to store all the scripts for our user
- `~/.config/` - Personal configuration folder for our user

# Alias

All the alias for our terminal are created on the file `~/.config/aliasrc`

- `l` - ls showing hidden folders with the directories first
- `ls` - Pretty ls
- `?` - Execute the script `duck` searching for what we put after
- `??` - Execute the script `bing` searching for what we put after
- `???` - Execute the script `google` searching for what we put after
- `vi` - Execute `vim`
- `download` - Execute `curl -sSLOfk` to download any file from the web
- `xc` - Copy the content from the terminal
- `c` - Clear the terminal

# Installation

**Beware**: This would change your configuration for the default user

```bash
# Change directory to a temporary one
cd /tmp
# Download the repo
git clone https://github.com/DeadS3c/Kali.git
# Change into the repo directory
cd Kali
# Give permissions and execute the setup.sh script
chmod u+x setup.sh && ./setup.sh
# Enter the password when need it, wait until reboot
```
