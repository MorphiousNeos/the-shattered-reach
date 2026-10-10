#!/bin/sh
# Starts the Godot world server on an internal port and nginx on the public $PORT.
set -e
PUBLIC_PORT="${PORT:-10000}"
GAME_PORT=10001
sed -e "s/__PORT__/${PUBLIC_PORT}/" -e "s/__GAME_PORT__/${GAME_PORT}/" /home/reach/nginx.conf.template > /tmp/nginx.conf
# --port makes Godot use the internal port; unset PORT so it doesn't pick the public one
env -u PORT /opt/godot --headless --main-pack /home/reach/server.pck -- --server --ws --port=${GAME_PORT} &
GODOT_PID=$!
# if the game server dies, stop the container so the host restarts it
# exec keeps this script's process ID, so $$ is nginx's ID once it starts
NGINX_PID=$$
( while kill -0 "$GODOT_PID" 2>/dev/null; do sleep 5; done; echo "World server exited, stopping container"; kill -TERM "$NGINX_PID" ) &
exec nginx -c /tmp/nginx.conf -g 'daemon off;'
