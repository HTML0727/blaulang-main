# Multi-stage Dockerfile for BlauLang

# 第一阶段：构建编译器
FROM ubuntu:20.04 AS builder

# 避免交互式配置
ENV DEBIAN_FRONTEND=noninteractive

# 安装构建依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    cmake \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /src

# 复制源代码
COPY . .

# 构建编译器
RUN make clean && make release

# 第二阶段：运行时镜像
FROM ubuntu:20.04

# 安装运行时依赖
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 创建非root用户
RUN useradd -m -s /bin/bash blau

# 设置工作目录
WORKDIR /workspace

# 从构建阶段复制编译器
COPY --from=builder /src/bin/blauc /usr/local/bin/blauc
COPY --from=builder /src/examples /usr/local/share/blau/examples

# 设置权限
RUN chmod +x /usr/local/bin/blauc

# 切换到非root用户
USER blau

# 设置环境变量
ENV PATH="/usr/local/bin:$PATH"
ENV BLAU_HOME="/usr/local/share/blau"

# 默认命令
CMD ["blauc", "--help"]

# 标签
LABEL maintainer="BlauLang Team"
LABEL version="0.1-alpha"
LABEL description="BlauLang compiler and runtime"

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD blauc --version || exit 1