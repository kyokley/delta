FROM rust:slim

ENV PATH="$PATH:/delta/target/debug"
RUN apt-get update -y && apt-get install -y git make
COPY . /delta
WORKDIR /delta

RUN make build

ENTRYPOINT ["delta"]
