.PHONY: all build clean run test format

all: build

build:
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build -j

clean:
	rm -rf build

run:
	./build/bin/blaulang-run

test:
	ctest --test-dir build --output-on-failure || echo 'Run tests from build directory'

format:
	clang-format -i $(shell find src include tools -name '*.cpp' -o -name '*.h' -o -name '*.hpp')
