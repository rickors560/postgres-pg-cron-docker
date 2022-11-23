FROM postgres:15

RUN apt-get update && apt-get -y install git build-essential postgresql-server-dev-15

RUN git clone https://github.com/citusdata/pg_cron.git
WORKDIR /pg_cron 
RUN export PATH=/usr/pgsql-15/bin:$PATH
RUN make && PATH=$PATH make install
WORKDIR /
# RUN cd pg_cron && make && make install

# RUN apt-get -y purge git build-essential postgresql-server-dev-15

COPY pg_cron_init.sh /docker-entrypoint-initdb.d