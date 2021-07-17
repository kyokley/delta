FROM rust:slim AS builder

ENV PATH="$PATH:/delta/target/release"
RUN apt-get update -y && apt-get install -y git make
COPY . /delta
WORKDIR /delta

RUN make build

FROM rust:slim AS final
ENV PATH="$PATH:/delta"
COPY --from=builder /delta/target/release /delta

WORKDIR /delta
ENTRYPOINT ["delta"]
