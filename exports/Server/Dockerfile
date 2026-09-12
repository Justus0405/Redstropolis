FROM eclipse-temurin:25

# Switch to default 1000:1000 user
USER ubuntu

# Create default folder structure
WORKDIR /home/ubuntu/redstropolis-server/

# Create Sub-folders
RUN mkdir -p "config" "mods" "world" "backups"

# Copy server files from host
COPY --chown=ubuntu:ubuntu . .

# Expose default minecraft port
EXPOSE 25565/tcp

# Start the server and healthcheck
ENTRYPOINT [ "/home/ubuntu/redstropolis-server/start.sh" ]
#HEALTHCHECK --start-period=2m --retries=2 --interval=30s CMD /home/ubuntu/redstropolis-server/health.sh