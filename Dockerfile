FROM python:3.12-slim
LABEL maintainer="volodabudzan4@gmail.com"

ENV PYTHONUNBUFFERED=1

WORKDIR /cinema

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN mkdir -p /files/media \
    && adduser --disabled-password --no-create-home my_user \
    && chown -R my_user /files/media \
    && chmod -R 755 /files/media

USER my_user
