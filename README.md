# zsh-logging

This is a simple logging script compatible with `/bin/zsh`. See [`example.sh`](example.sh) for the example illustrated below and it's documentation.

### Features

- Colorful messages with timestamps and propper indents
- Pipe output to log file (`logs/logger.log`)
- Handy logging functions (`DEBUG`, `INFO`, `SUCCESS`, `WARN`, `ERROR`)
- Debugging of function calls (`ENTRY` and `EXIT`)

### Output

![zsh-logging](https://github.com/jeliasson/zsh-logging/blob/main/docs/example-output.png?raw=true)

### Todo

- [x] Strip off terminal colors from output log file
- [ ] Pass in custom date format as argument
- [ ] Create color variables in every function

### Extra

See [`docs/colors.sh`](docs/colors.sh) to print a table of your terminal colors
