FROM yuuk1/perl:5.20.1

RUN apt-get update && \
    apt-get install -yqq --no-install-recommends mysql-client-5.5 libmysqlclient-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY cpanfile $APPROOT/cpanfile
RUN carton install
COPY ./ $APPROOT

EXPOSE 5000
CMD ["script/app"]
