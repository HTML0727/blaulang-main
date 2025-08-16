# BlauLang 包结构重组说明

本项目已完成包结构的全面重组，按照功能性分类将包分离到不同的GitHub仓库，并建立了完整的包管理系统。

## 📁 新包结构

### 核心项目结构
```
BlauLang/
├── src/                    # 核心编译器源码
├── packages/               # 基础包（保留在核心仓库）
│   ├── std/               # 标准库
│   └── blauplot/          # 可视化包（示例）
├── packagemanager/        # 包管理系统 (pkgman)
│   ├── src/pkgman.bl      # 核心包管理器
│   ├── repositories.json  # 仓库配置
│   └── README.md          # 使用文档
├── external-repos/        # 外部仓库文档
│   ├── blau-visual/       # 可视化包仓库
│   ├── blau-data/         # 数据处理包仓库
│   ├── blau-web/          # Web开发包仓库
│   ├── blau-ai/           # AI/ML包仓库
│   ├── blau-security/     # 安全包仓库
│   └── ...                # 其他分类仓库
└── README.md              # 更新后的主文档
```

## 🏗️ 包分类系统

### 1. 基础包 (保留在核心仓库)
- **std**: 标准库
- **pkgman**: 包管理器
- **test**: 测试框架
- **doc**: 文档工具

### 2. 功能性分类仓库

#### blau-visual (数据可视化)
- **blauplot**: 类似 matplotlib 的图表库 ✅
- **blaucharts**: 高级图表库
- **blaugraphics**: 2D/3D 图形处理
- **blaucanvas**: 绘图和画布操作

#### blau-data (数据处理)
- **blaudb**: 数据库抽象层
- **blauframe**: 类似 pandas 的数据框架
- **blaumachine**: 机器学习库
- **blaustats**: 统计分析
- **blauetl**: 数据提取转换加载

#### blau-web (Web开发)
- **blauhttp**: HTTP 客户端/服务器
- **blauweb**: 全栈 Web 框架
- **blauapi**: RESTful API 框架
- **blauwebsocket**: WebSocket 支持
- **blaumobile**: 移动端开发

#### blau-ai (人工智能)
- **blaubrain**: 神经网络框架
- **blauvision**: 计算机视觉
- **blaunlp**: 自然语言处理
- **blaugen**: 生成式 AI
- **blauaudio**: 音频处理

#### blau-security (安全工具)
- **blaucrypto**: 现代加密库
- **blauauth**: 身份认证框架
- **blautls**: TLS/SSL 通信
- **blauaudit**: 安全审计
- **blauvpn**: VPN 工具

#### blau-dev (开发工具)
- **blaulint**: 代码检查
- **blauformat**: 代码格式化
- **blaudebug**: 调试工具
- **blauwatch**: 文件监控
- **blautest**: 测试增强

#### blau-utils (实用工具)
- **blaufs**: 文件系统操作
- **blaucli**: 命令行工具
- **blautime**: 时间处理
- **blauconfig**: 配置管理
- **blaulog**: 日志系统

## 🚀 包管理系统 (pkgman)

### 核心功能
- ✅ 包搜索和安装
- ✅ 依赖管理
- ✅ 版本控制
- ✅ 多仓库支持
- ✅ 分类浏览

### 使用示例
```bash
# 安装包
pkgman install blauplot

# 按分类搜索
pkgman search plot visualization

# 查看已安装
pkgman list

# 更新包
pkgman update
```

### 仓库映射
| 分类 | 仓库名 | GitHub URL |
|------|--------|------------|
| 可视化 | blau-visual | https://github.com/blau-visual |
| 数据 | blau-data | https://github.com/blau-data |
| Web | blau-web | https://github.com/blau-web |
| AI | blau-ai | https://github.com/blau-ai |
| 安全 | blau-security | https://github.com/blau-security |
| 开发 | blau-dev | https://github.com/blau-dev |
| 工具 | blau-utils | https://github.com/blau-utils |

## 📋 迁移计划

### 阶段1: 基础架构 ✅
- [x] 创建 pkgman 包管理器
- [x] 建立仓库分类系统
- [x] 创建外部仓库文档
- [x] 更新项目结构

### 阶段2: 包迁移
- [ ] 将 blauplot 迁移到 blau-visual
- [ ] 创建 blau-data 初始包
- [ ] 建立 CI/CD 工作流
- [ ] 设置自动化发布

### 阶段3: 生态建设
- [ ] 社区贡献指南
- [ ] 包开发模板
- [ ] 文档标准化
- [ ] 测试覆盖率

## 🎯 使用指南

### 开发者
1. **创建新包**: 使用 `pkgman init` 初始化
2. **选择仓库**: 根据功能选择对应分类仓库
3. **遵循规范**: 使用标准包结构
4. **提交PR**: 向对应仓库提交代码

### 用户
1. **安装包管理器**: 已包含在 BlauLang 中
2. **搜索包**: 使用 `pkgman search <关键词>`
3. **安装包**: 使用 `pkgman install <包名>`
4. **查看文档**: 每个包都有详细 README

## 🔧 技术规范

### 包命名规范
- 使用小写字母和连字符
- 前缀为 `blau` + 功能描述
- 避免与现有包冲突

### 版本管理
- 遵循语义化版本控制 (SemVer)
- 使用 git tag 标记版本
- 维护 CHANGELOG.md

### 依赖管理
- 明确声明依赖版本
- 避免循环依赖
- 定期更新依赖

## 📞 支持

- **文档**: 每个仓库的 README.md
- **问题**: GitHub Issues
- **讨论**: GitHub Discussions
- **社区**: BlauLang 官方论坛

## 📄 许可证

所有包默认使用 MIT License，除非另有说明。