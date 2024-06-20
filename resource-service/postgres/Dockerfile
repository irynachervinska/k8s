FROM postgres:13

COPY resource-init.sql /docker-entrypoint-initdb.d

ENV POSTGRES_DB resource
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD password