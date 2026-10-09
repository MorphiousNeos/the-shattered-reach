# World server

`server.pck` is the headless world server for The Shattered Reach (Godot 4.3), built from the game's
source. `Dockerfile` runs it on any Docker host. It listens for WebSocket connections on `$PORT`
(default 10000). Players join with `wss://<your-host>`.

- Version must match the game build: server and clients are rebuilt together.
- The world (day, quest, NPC memories) is saved inside the container. On hosts without a persistent
  disk (such as Render's free tier) the world starts fresh after every restart or sleep.
- Up to 8 players per world.
