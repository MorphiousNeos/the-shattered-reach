# The Shattered Reach

An open-world co-op dark-fantasy RPG. Make a Diver, wake in the village of Emberfall with your friends, talk to NPCs who remember you, and hunt Grimhollow the Ash Stag in the Cinder Wood.

**Play in your browser:** https://morphiousneos.github.io/the-shattered-reach/

This repository holds the browser build only. The full PC version (better graphics, hosting) is shared separately.

## Playing together

Click **Join the public world** on the title screen. Everyone who does shares one world, run by a free cloud server, with no one needing to host from their own computer.

- The free server sleeps when nobody is playing. The first player in waits about a minute while it wakes; the game shows a countdown.
- The world starts fresh whenever the server restarts or sleeps (free hosting has no permanent disk).
- Up to 8 players at once.

You can still host privately from the PC version, or run your own copy of the server: see [`server/`](server/README.md).

## Repository layout

| Path | What it is |
| --- | --- |
| `index.*` | The browser game (Godot 4.3 web export) served by GitHub Pages |
| `server/` | The world server (`server.pck` + `Dockerfile`) |
| `render.yaml` | Render Blueprint that deploys `server/` as a free web service |

## Controls

WASD move · Shift sprint · Space jump · Q dodge · Left/Right mouse attack · E talk · Enter chat · Esc menu · F11 fullscreen

Best in Chrome or Edge on a desktop or laptop. The first load downloads about 60 MB.
