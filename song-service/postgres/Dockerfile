FROM postgres:13

COPY song-init.sql /docker-entrypoint-initdb.d

ENV POSTGRES_DB song
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD password