ARG PYTHON_VERSION=3.11
FROM dockerhub.cisco.com/docker.io/python:${PYTHON_VERSION}-slim
WORKDIR /
ENV RADKIT_DIRECTORY="/radkit"

COPY wheels/ wheels/
COPY start.sh start.sh

RUN apt update && apt upgrade -y && python3 -m pip install -U pip
RUN apt install gcc -y \
    && python3 -m pip install -f wheels/ cisco_radkit_service \
    && apt remove gcc -y \
    && apt autoremove -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
RUN chmod +x start.sh
RUN mkdir ${RADKIT_DIRECTORY}

VOLUME ${RADKIT_DIRECTORY}
EXPOSE 8081

# This must be ENTRYPOINT, not CMD, so that there is proper signal handling. Also,
# ENTRYPOINT must be written in the "exec form" (JSON array), not the shell form.
ENTRYPOINT [ "/start.sh" ]