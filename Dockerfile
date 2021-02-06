# NGINX Unit image of Python3.7
FROM nginx/unit:1.21.0-python3.7

# create work directory of container
WORKDIR /usr/src/app

COPY . .

RUN apt-get update \
    && apt-get install -y python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pipenv && \
    pipenv install --system --ignore-pipfile --deploy

# port used by the listener in config.json
EXPOSE 8080
