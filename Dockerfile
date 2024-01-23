FROM postgres:latest

ENV POSTGRES_DB=shinomontazh
ENV POSTGRES_USER=lessed
ENV POSTGRES_PASSWORD=12345666

COPY shinomontage.sql /docker-entrypoint-initdb.d/

CMD ["postgres"]