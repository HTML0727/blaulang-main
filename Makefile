# BlauLang Makefile for Linux

# 编译器设置
CC = gcc
CXX = g++
PYTHON = python3

# 编译标志
CFLAGS = -Wall -Wextra -std=c11 -O2
CXXFLAGS = -Wall -Wextra -std=c++17 -O2
LDFLAGS = -lpthread -ldl

# 目录设置
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# 源文件
COMPILER_SRCS = $(wildcard $(SRC_DIR)/compiler/*.bl)
STDLIB_SRCS = $(wildcard $(SRC_DIR)/stdlib/*.bl)

# 目标文件
COMPILER_OBJ = $(BUILD_DIR)/compiler.o
STDLIB_OBJ = $(BUILD_DIR)/stdlib.o
BLAUC = $(BIN_DIR)/blauc

# 默认目标
all: $(BLAUC)

# 创建目录
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# 编译编译器
$(COMPILER_OBJ): $(COMPILER_SRCS) | $(BUILD_DIR)
	@echo "Building compiler..."
	$(CC) $(CFLAGS) -c $(SRC_DIR)/compiler/compiler.bl -o $(COMPILER_OBJ)

# 编译标准库
$(STDLIB_OBJ): $(STDLIB_SRCS) | $(BUILD_DIR)
	@echo "Building standard library..."
	$(CC) $(CFLAGS) -c $(SRC_DIR)/stdlib/io.bl -o $(BUILD_DIR)/io.o
	$(CC) $(CFLAGS) -c $(SRC_DIR)/stdlib/math.bl -o $(BUILD_DIR)/math.o
	$(CC) $(CFLAGS) -c $(SRC_DIR)/stdlib/net/socket.bl -o $(BUILD_DIR)/socket.o
	$(CC) $(CFLAGS) -c $(SRC_DIR)/stdlib/concurrent/hashmap.bl -o $(BUILD_DIR)/hashmap.o

# 链接最终可执行文件
$(BLAUC): $(COMPILER_OBJ) $(STDLIB_OBJ) | $(BIN_DIR)
	@echo "Linking BlauLang compiler..."
	$(CC) $(LDFLAGS) $(COMPILER_OBJ) $(BUILD_DIR)/*.o -o $(BLAUC)
	@echo "BlauLang compiler built successfully!"

# 运行示例程序
run: $(BLAUC)
	@echo "Running hello.bll..."
	./$(BLAUC) hello.bll

# 测试
test: $(BLAUC)
	@echo "Running tests..."
	./$(BLAUC) test

# 清理
clean:
	@echo "Cleaning build files..."
	rm -rf $(BUILD_DIR)
	rm -rf $(BIN_DIR)
	rm -f *.o

# 安装
install: $(BLAUC)
	@echo "Installing BlauLang..."
	cp $(BLAUC) /usr/local/bin/
	chmod +x /usr/local/bin/blauc
	@echo "BlauLang installed to /usr/local/bin/blauc"

# 卸载
uninstall:
	@echo "Uninstalling BlauLang..."
	rm -f /usr/local/bin/blauc
	@echo "BlauLang uninstalled"

# 开发模式 (调试版本)
debug: CFLAGS += -g -DDEBUG
debug: $(BLAUC)

# 发布模式 (优化版本)
release: CFLAGS += -O3 -DNDEBUG
release: $(BLAUC)

# 跨平台编译目标
linux-x86_64: $(BLAUC)
	@echo "Built for Linux x86_64"

linux-arm64: CC = aarch64-linux-gnu-gcc
linux-arm64: $(BLAUC)
	@echo "Built for Linux ARM64"

# 静态分析
analyze:
	@echo "Running static analysis..."
	cppcheck --enable=all $(SRC_DIR)/

# 格式化代码
format:
	@echo "Formatting code..."
	clang-format -i $(SRC_DIR)/**/*.bl

# 生成文档
docs:
	@echo "Generating documentation..."
	$(PYTHON) docs/generate_docs.py

# 包管理
package-install: $(BLAUC)
	./$(BLAUC) package install math@1.0.0

package-lock: $(BLAUC)
	./$(BLAUC) package lock

# 性能测试
benchmark: $(BLAUC)
	./$(BLAUC) benchmark

# 帮助
help:
	@echo "BlauLang Makefile"
	@echo "=================="
	@echo ""
	@echo "Available targets:"
	@echo "  all         - Build the compiler (default)"
	@echo "  run         - Build and run hello.bll"
	@echo "  test        - Run tests"
	@echo "  clean       - Clean build files"
	@echo "  install     - Install to /usr/local/bin"
	@echo "  uninstall   - Remove from /usr/local/bin"
	@echo "  debug       - Build debug version"
	@echo "  release     - Build release version"
	@echo "  linux-x86_64 - Build for Linux x86_64"
	@echo "  linux-arm64 - Build for Linux ARM64"
	@echo "  analyze     - Run static analysis"
	@echo "  format      - Format code"
	@echo "  docs        - Generate documentation"
	@echo "  package-install - Install packages"
	@echo "  package-lock - Generate lock file"
	@echo "  benchmark   - Run benchmarks"
	@echo "  help        - Show this help"

.PHONY: all run test clean install uninstall debug release analyze format docs package-install package-lock benchmark help