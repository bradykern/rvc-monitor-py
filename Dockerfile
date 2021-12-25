# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app
COPY requirement.txt requirement.txt
RUN pip3 install -r requirement.txt
COPY etc/rvc/rvc-spec.yml .
COPY usr/bin/rvc2mqtt.py .

CMD python3 rvc2mqtt.py -s rvc-spec.yml -i can0 -m 1 -u mqtt -pwd p455wd! -b 127.0.0.1