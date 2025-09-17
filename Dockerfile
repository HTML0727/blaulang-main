FROM ubuntu:22.04
RUN apt-get update && apt-get install -y build-essential cmake git clang-format
WORKDIR /work
COPY . /work
RUN cmake -S . -B build && cmake --build build -j
CMD ["/work/build/bin/blaulang-run"]
