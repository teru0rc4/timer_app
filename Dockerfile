# NGINX Unit image of Python3.7
FROM nginx/unit:1.21.0-python3.7

# create work directory of container
WORKDIR /usr/src/app

COPY src .

RUN apt-get update \
    && apt-get install -y python3-pip \
    && pip3 install --no-cache-dir -r ./requirements.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# port used by the listener in config.json
EXPOSE 8080
