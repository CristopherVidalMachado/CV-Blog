FROM amberframework/amber:v0.8.0

WORKDIR /app

COPY shard.* /app/
RUN shards

COPY . /app

RUN rm -rf /app/node_modules

CMD amber watch
