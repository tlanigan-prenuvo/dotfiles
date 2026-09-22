---
name: keys
description: Keyboard cheatsheet for this machine - herdr panes and tabs inside WezTerm, and scrolling in Claude Code. Use when asked how to split, switch panes or tabs, or scroll without a mouse.
---

# Keys

Output this cheatsheet to the user.

herdr prefix is `Ctrl+B`. Press it, release, then the next key.

## Panes

| Action | Key |
|---|---|
| Split stacked (horizontal divider) | `Ctrl+B "` |
| Split side by side (vertical divider) | `Ctrl+B %` |
| Move between panes | `Ctrl+B` then `h` `j` `k` `l` |
| Cycle panes | `Ctrl+B Tab` |
| Zoom pane to full tab | `Ctrl+B z` |
| Close pane | `Ctrl+B x` |
| Resize (sticky mode, `Esc` exits) | `Ctrl+B r` |

## Tabs

| Action | Key |
|---|---|
| New tab | `Ctrl+B c` |
| Previous / next | `Ctrl+B p` / `Ctrl+B n` |
| Jump to tab 1-9 | `Ctrl+B 1` .. `Ctrl+B 9` |
| Close tab | `Ctrl+B &` |

## Scrolling

Depends on what the pane is running.

**Claude Code pane:** `Ctrl+O` (letter O, not zero) enters transcript mode.

| Key | Action |
|---|---|
| `j` / `k` | line down / up |
| `space` / `b` | page down / up |
| `g` / `G` | top / bottom |
| `q` or `Esc` | exit |

**Shell / log pane:** `Ctrl+B y` enters copy mode. Vim motions (`h j k l`, `w`/`b`,
`g`/`G`), `/` to search, `v` to select, `y` to copy, `q` to exit.

`Ctrl+B y` shows nothing in a Claude Code or nvim pane. Those apps repaint the
screen instead of scrolling it, so herdr has no history to show. Use the app's
own keys.
