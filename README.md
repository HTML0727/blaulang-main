# Blaulang

Blaulang 是一个实验性编程语言，基于 C++17 开发，使用 CMake 构建，支持解释执行和 JIT 编译。  
本项目目标是提供一个现代化、模块化、可扩展的语言实现。

## 特性
- 词法分析 / 语法解析 / 抽象语法树
- 中间表示与优化（IR + passes）
- 字节码虚拟机与 JIT
- 内置垃圾回收的运行时
- 扩展丰富的标准库
- 开发工具链（编译器、包管理器、调试器、REPL）

## 构建
```bash
mkdir build && cd build
cmake ..
make -j4
```

## 运行
```bash
./blaulang ../examples/hello.bll
```

## 目录结构
- `src/` 核心源代码
- `include/` 公共头文件
- `stdlib/` 语言标准库
- `tools/` 开发工具
- `docs/` 文档
- `tests/` 测试
- `benchmarks/` 性能基准

## 贡献
欢迎提交 Issue 和 PR。请先阅读 `contrib/README.md`。
