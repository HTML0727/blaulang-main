# BlauLang (BLLang)

**版本**: 0.1-alpha  
**构建状态**: [![构建状态](https://img.shields.io/badge/build-alpha-orange)](https://github.com/yourusername/BlauLang)

BlauLang是一门可高度自定义的编程语言，语法参考Python，易于上手，并支持多平台编译。语言中融入了少量德语关键字，为编程体验增添独特性。

## 项目结构
- `docs/`: 包含中、日、英三种语言的详细文档
- `src/`: 编译器源代码
  - `compiler/`: 编译器核心组件
    - `frontend/`: 前端（词法分析、语法分析）
    - `backend/`: 后端（代码生成、优化）
    - `utils/`: 工具函数

## 🚀 Alpha 0.1 主要特性
- 基础词法/语法分析器
- 中间表示(IR)生成与优化
- IR解释执行功能
- 多语言技术文档支持

## 语言特性
- 简洁易学的语法，参考Python
- 支持多平台编译（类似Java）
- 独特的德语关键字（约占5%）
- 自定义的注释方式
- 灵活的导入系统

## 快速开始
详情请查看各语言文档。

## 🎯 包管理系统 (pkgman)

BlauLang 现已集成完整的包管理系统 `pkgman`，支持多仓库包管理。

### 📦 包分类系统
| 分类 | 描述 | 安装示例 | 官方仓库 |
|------|------|----------|----------|
| **可视化** | 图表、绘图 | `pkgman install blauplot` | [blau-visual](https://github.com/blau-visual) |
| **数据** | 数据库、分析 | `pkgman install blaudb` | [blau-data](https://github.com/blau-data) |
| **Web** | HTTP、Web框架 | `pkgman install blauhttp` | [blau-web](https://github.com/blau-web) |
| **AI** | 机器学习 | `pkgman install blaubrain` | [blau-ai](https://github.com/blau-ai) |
| **安全** | 加密、认证 | `pkgman install blaucrypto` | [blau-security](https://github.com/blau-security) |
| **开发** | 开发工具 | `pkgman install blaulint` | [blau-dev](https://github.com/blau-dev) |
| **工具** | 实用工具 | `pkgman install blaufs` | [blau-utils](https://github.com/blau-utils) |

### 🚀 快速开始 pkgman
```bash
# 搜索包
pkgman search plot
pkgman search data visualization

# 安装包
pkgman install blauplot
pkgman install blauplot@0.2.0

# 查看已安装
pkgman list

# 更新包
pkgman update

# 卸载包
pkgman remove blauplot
```

### 📊 核心仓库结构
```
BlauLang/
├── packages/               # 基础包（核心仓库）
│   ├── std/               # 标准库
│   └── [基础包保留]        # 仅基础包保留在此
├── packagemanager/        # 包管理系统
│   ├── src/pkgman.bl      # 核心包管理器
│   └── repositories.json  # 仓库配置
├── external-repos/        # 外部仓库文档
└── [其他包已分离]         # 功能性包分离到独立仓库
```

### 🎯 扩展仓库列表
| 仓库名 | 功能描述 | 状态 | 示例包 |
|--------|----------|------|--------|
| **blau-visual** | 数据可视化 | ✅ 活跃 | blauplot, blaucharts |
| **blau-data** | 数据处理 | 🔄 开发中 | blaudb, blauframe |
| **blau-web** | Web开发 | 📋 计划中 | blauhttp, blauweb |
| **blau-ai** | 人工智能 | 💡 规划中 | blaubrain, blauvision |
| **blau-security** | 安全工具 | 📋 计划中 | blaucrypto, blauauth |
| **blau-dev** | 开发工具 | 💡 规划中 | blaulint, blaudebug |
| **blau-utils** | 实用工具 | 💡 规划中 | blaufs, blautime |

### 📈 热门包示例
```bash
# 数据可视化
pkgman install blauplot        # 类似 matplotlib

# 数据处理  
pkgman install blaudb          # 数据库抽象层

# Web开发
pkgman install blauhttp        # HTTP客户端/服务器

# 安全工具
pkgman install blaucrypto      # 现代加密库

# 机器学习
pkgman install blaubrain       # 神经网络框架
```

### 多平台使用指南
- [📚 跨平台使用指南](docs/cross-platform-guide.md)
- [🐧 Linux 安装指南](docs/linux-install-guide.md)
- [🪟 Windows 运行指南](docs/windows-guide.md)
- [🐳 Docker 部署](docs/docker-guide.md)
- [📦 扩展包指南](docs/extension-guide.md)

### 平台支持矩阵
| 平台 | 架构 | 状态 | 构建工具 | 备注 |
|------|------|------|----------|------|
| **Linux** | x64, arm64 | ✅ 完全支持 | `make` / `linux-build.sh` | 推荐平台 |
| **Windows** | x64, arm64 | ✅ 完全支持 | `windows-build.ps1` | 原生支持 |
| **macOS** | x64, arm64, universal | ✅ 完全支持 | `macos-build.sh` | 完整功能 |
| **WebAssembly** | wasm32 | ⚠️ 实验支持 | `make wasm` | 浏览器运行 |
| **Docker** | multi-arch | ✅ 完全支持 | `docker-compose` | 容器化部署 |

### 快速开始

#### 方法1: 克隆项目
```bash
git clone https://github.com/blaulang/blau-core.git
cd blau-core
make build
```

#### 方法2: Docker 方式
```bash
git clone https://github.com/blaulang/blau-core.git
cd blau-core
docker-compose up --build
```

#### 方法3: 本地构建
```bash
# Linux/macOS
./.platform/linux-build.sh --arch x64 --config Release

# Windows
.\.platform\windows-build.ps1 -Architecture x64 -Configuration Release
```

#### 方法4: 安装扩展包
```bash
# 安装数据科学扩展
blauc package install blaulang/data-science

# 安装 Web 开发扩展
blauc package install blaulang/web-development

# 安装单个包
blauc package install blauplot
```