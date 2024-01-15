FROM debian:bullseye-slim

# get redis
RUN apt-get update
RUN apt-get install redis-server -y

COPY ./tools/init.sh ./init.sh
RUN chmod +x ./init.sh

COPY ./config/redis.conf ./redis.conf

EXPOSE 6379

ENTRYPOINT ["./init.sh"]
