# The Shattered Reach world server.
# Runs the same headless Godot server as "World server (browser + PC).bat", packaged for any
# Docker host (Render free tier, Oracle Cloud, a home server...).
FROM debian:bookworm-slim

ARG GODOT_VERSION=4.3-stable
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates wget unzip \
 && wget -q "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_linux.x86_64.zip" -O /tmp/godot.zip \
 && unzip -q /tmp/godot.zip -d /opt \
 && mv "/opt/Godot_v${GODOT_VERSION}_linux.x86_64" /opt/godot \
 && rm /tmp/godot.zip \
 && apt-get purge -y wget unzip && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

# run as an unprivileged user
RUN useradd --create-home reach
USER reach
WORKDIR /home/reach

COPY --chown=reach server.pck /home/reach/server.pck

# Cloud hosts set $PORT; the server reads it and switches to WebSocket mode automatically.
ENV PORT=10000
EXPOSE 10000
CMD ["/opt/godot", "--headless", "--main-pack", "/home/reach/server.pck", "--", "--server"]
