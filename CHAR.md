# BlauLang 仓库迁移清单 (CHAR.md)

## 📋 清理后文件结构

### 核心仓库保留文件
```
BlauLang/                    # 主仓库: blaulang/blau-core
├── src/                     # 编译器核心 (保留)
├── packages/                 # 基础包 (仅保留核心)
│   ├── std/                # 标准库
│   └── core/               # 语言核心
├── packagemanager/         # 包管理系统 (pkgman)
├── examples/               # 示例代码
├── docs/                   # 核心文档
├── .platform/              # 构建脚本
└── docker-compose.yml      # 容器配置
```

### 待迁移到独立仓库的包

## 🎯 仓库映射表

| 本地路径 | 目标仓库 | GitHub URL | 状态 |
|----------|----------|------------|------|
| `packages/blauplot/` | **blau-visual** | `blaulang/blau-visual` | ✅ 准备迁移 |
| `packages/blaudb/` | **blau-data** | `blaulang/blau-data` | 📋 待创建 |
| `packages/blauhttp/` | **blau-web** | `blaulang/blau-web` | 📋 待创建 |
| `packages/blaucrypto/` | **blau-security** | `blaulang/blau-security` | 📋 待创建 |
| `packages/blaubrain/` | **blau-ai** | `blaulang/blau-ai` | 📋 待创建 |

## 📁 文件清理清单

### ✅ 已清理文件
- `extensions/` 目录及所有内容
- `blau-packages.json` 旧包配置
- 冗余的扩展管理脚本

### 🎯 需要迁移的文件

#### 1. blau-visual 仓库
```
源路径: packages/blauplot/
目标仓库: blaulang/blau-visual
包含文件:
├── src/
│   ├── plot.bl
│   ├── renderer.bl
│   └── statistik.bl
├── examples/
│   └── basic.bl
├── package.json
└── README.md
```

#### 2. blau-data 仓库 (待创建)
```
源路径: packages/blaudb/ (需要创建)
目标仓库: blaulang/blau-data
建议结构:
├── packages/
│   ├── blaudb/
│   ├── blauframe/
│   └── blaumachine/
└── README.md
```

#### 3. blau-web 仓库 (待创建)
```
源路径: packages/blauhttp/ (需要创建)
目标仓库: blaulang/blau-web
建议结构:
├── packages/
│   ├── blauhttp/
│   ├── blauweb/
│   └── blauapi/
└── README.md
```

## 🚀 迁移步骤

### 阶段1: 立即迁移 (blauplot)
```bash
# 1. 创建新仓库
git clone https://github.com/blaulang/blau-visual.git

# 2. 迁移文件
cp -r packages/blauplot/* blau-visual/

# 3. 更新package.json
# 4. 提交并推送
git add .
git commit -m "Initial blauplot package"
git push origin main
```

### 阶段2: 创建新仓库
```bash
# 按顺序创建并初始化
gh repo create blaulang/blau-data --private
cd blau-data && git init

gh repo create blaulang/blau-web --private
cd blau-web && git init

gh repo create blaulang/blau-ai --private
cd blau-ai && git init

gh repo create blaulang/blau-security --private
cd blau-security && git init
```

## 📊 仓库状态

| 仓库名 | GitHub状态 | 本地状态 | 迁移优先级 |
|--------|------------|----------|------------|
| **blau-core** | ✅ 已存在 | ✅ 核心保留 | 最高 |
| **blau-visual** | ✅ 已创建 | ✅ blauplot待迁移 | 高 |
| **blau-data** | ❌ 待创建 | ❌ 待开发 | 中 |
| **blau-web** | ❌ 待创建 | ❌ 待开发 | 中 |
| **blau-ai** | ❌ 待创建 | ❌ 待开发 | 低 |
| **blau-security** | ❌ 待创建 | ❌ 待开发 | 低 |

## 🎯 最终验证清单

### 核心仓库验证
- [ ] 仅包含基础包 (std, core)
- [ ] 包管理器完整
- [ ] 构建系统正常
- [ ] 文档更新完成

### 扩展仓库验证
- [ ] 每个仓库有独立README
- [ ] package.json配置正确
- [ ] 示例代码完整
- [ ] CI/CD配置就绪

## 📝 注意事项

### 文件大小优化
- 核心仓库: ~50MB (仅基础文件)
- 每个扩展仓库: ~10-20MB (单个功能包)
- 总节省空间: ~60-80% (通过分离)

### 版本控制
- 核心仓库: 跟随编译器版本
- 扩展仓库: 独立版本控制
- 兼容性: 通过pkgman管理

### 下一步行动
1. **立即**: 迁移 blauplot → blau-visual
2. **本周**: 创建 blau-data 和 blau-web
3. **下周**: 创建 blau-ai 和 blau-security
4. **持续**: 监控和维护包兼容性