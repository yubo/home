# Shell (bash) tips

## keybindings

map   | desc
--    | --
C-a   | move to the start of the command line
C-e   | move to the end of the command line
C-p   | previous command in history
C-n   | next command in history
C-b   | move backward one character
C-f   | move forward one character
C-u   | delete from cursor to start of line
C-k   | delete from cursor to end of line
C-w   | delete word before cursor
C-r   | reverse search command history
C-l   | clear the screen
C-d   | delete character under cursor (or exit shell if line is empty)

## aliases

alias | desc
--    | --
ff    | find files and grep by content (`find . -type f \| xargs grep -n --color`)
ffgo  | like ff but only searches `.go` files
ll    | list files with details
la    | list all files including hidden
ta    | create or attach to a tmux session (`tmux new -As <name>`)
shs   | start a simple HTTP server (`python3 -m http.server`)
ccd   | cd to the resolved physical path (resolves symlinks)

## environment helpers

- `le` — source `./env` or `./.env` if present in current directory
- `mycd` — extended `cd` that auto-sources `./env` on directory change
- `color_my_prompt` — colorizes the shell prompt with user, host, path, git branch

## path management

- `add_path <dir>` — adds directory to `$PATH` if it exists and isn't already there
- `add_classpath <jar>` — adds jar to `$CLASSPATH` if it exists and isn't already there

## SEE ALSO

- [tmux](tmux.md)
- [ubuntu](ubuntu.md)
- [centos](centos.md)
- [osx](osx.md)
