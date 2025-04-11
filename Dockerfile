FROM openjdk:17-jdk-slim

WORKDIR /app

# Install curl and wget just in case
RUN apt-get update && apt-get install -y curl wget && rm -rf /var/lib/apt/lists/*

# Copy the server files and startup script
COPY server /app

RUN chmod +x /app/startserver.sh

# Agree to EULA
RUN echo "eula=true" > eula.txt

# Expose Minecraft port
EXPOSE 25565

ENV ATM9_JAVA=java
ENV ATM9_RESTART=true
ENV ATM9_INSTALL_ONLY=false

CMD ["bash", "startserver.sh"]
