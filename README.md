# Tmux DND status

Tmux plugin that enables displaying the DND (do-not-disturb) status of your mac

Introduces a new `#{dnd_status}` format. It requires the `node` module, `do-not-disturb-cli`, to be installed globally.

Tested and working on macOs only.

### Usage

Add `#{dnd_status}` format string to your existing `status-right` or `status-left` tmux
option.

Here's the example in `.tmux.conf`:

set -g status-right "#{dnd_status} | %a %h-%d %H:%M "

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

set -g @plugin 'megalithic/tmux-dnd-status'

Hit `prefix + I` to fetch the plugin and source it.

`#{dnd_status}` interpolation should now work.

### Manual Installation

Clone the repo:

\$ git clone https://github.com/megalithic/tmux-dnd-status ~/clone/path

Add this line to the bottom of `.tmux.conf`:

run-shell ~/clone/path/dnd-status.tmux

Reload TMUX environment:

# type this in terminal

\$ tmux source-file ~/.tmux.conf

`#{dnd_status}` interpolation should now work.

### Limitations

DND status text most likely won't be instant. The duration depends on the
`status-interval` Tmux option. So, it might take anywhere between 5 and 60
seconds for DND status text to change.

Set `status-interval` to a low number to make this faster, example:

# in .tmux.conf

set -g status-interval 5

### License

[MIT](LICENSE.md)
