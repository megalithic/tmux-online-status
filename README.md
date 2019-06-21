# Tmux Online Status

Tmux plugin that enables displaying the IP addresses of your mac

Introduces a new `#{online_status}` format.

Tested and working on macOs only.

### Usage

Add `#{online_status}` format string to your existing `status-right` or `status-left` tmux
option.

Here's the example in `.tmux.conf`:

```tmux
set -g status-right "#{online_status} | %a %h-%d %H:%M "
```

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```tmux
set -g @plugin 'megalithic/tmux-online-status'
```

Hit `prefix + I` to fetch the plugin and source it.

`#{online_status}` interpolation should now work.

### Manual Installation

Clone the repo:

```sh
$ git clone https://github.com/megalithic/tmux-online-status ~/clone/path`
```

Add this line to the bottom of `.tmux.conf`:
`run-shell ~/clone/path/online-status.tmux`

Reload TMUX environment:

```sh
$ tmux source-file ~/.tmux.conf
```

`#{online_status}` interpolation should now work.

### Limitations

Online/IP status text most likely won't be instant. The duration depends on the
`status-interval` Tmux option. So, it might take anywhere between 5 and 60
seconds for online/IP status text to change.

Set `status-interval` to a low number to make this faster, example (in `.tmux.conf`):

```tmux
set -g status-interval 5
```

### License

[MIT](LICENSE.md)
