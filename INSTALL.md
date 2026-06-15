# 下载与安装指南

本文档说明如何安装 paper-cowork 插件及其推荐的辅助技能。

---

## paper-cowork 的安装方式

安装的核心是让 Claude Code 识别到 slash command：`/paper-cowork`

> 当前最新版本：**v2.0.0** — 已将旧版两个命令（`/setup-paper-workspace` + `/paper-pipeline`）合并为统一的 `/paper-cowork`。从旧版升级请覆盖安装即可。

### 方式 1：Plugin 模式加载（推荐先试用）

```bash
git clone https://github.com/Jonoo-no/paper-cowork.git
cd paper-cowork
claude --plugin-dir ./
```

插件自带的 `skills/<name>/SKILL.md` 会自动注册为 slash command，`${CLAUDE_PLUGIN_ROOT}` 自动指向插件目录。

### 方式 2：永久安装（注册 slash command）

如果不想每次指定 `--plugin-dir`，可以在 `.claude/skills/` 下注册：

```bash
# 克隆到固定位置
git clone https://github.com/Jonoo-no/paper-cowork.git ~/paper-cowork-plugin

# 一键复制 SKILL.md
cp -r ~/paper-cowork-plugin/skills/* ~/.claude/skills/
```

重启 Claude Code 后，`/paper-cowork` 就会出现在 slash commands 中。

> 永久安装后，插件目录 `~/paper-cowork-plugin/` 不能删除，因为 SKILL.md 引用了其中的 agent 文件。

### 方式 3：从 Release 下载 ZIP

1. 打开 [Releases 页面](https://github.com/Jonoo-no/paper-cowork/releases)
2. 下载最新版 **v2.0.0** 的 Source code (zip)
3. 解压并参照方式 1 或 2 安装

---

## 依赖：安装辅助技能

这些技能不是必需的，但安装后可以获得更完整的功能。

### 依赖总览

| 技能 | 用途 | paper-cowork 中调用 | 仓库 |
|------|------|-------------------|------|
| nature-skills 合集 | 文献检索、图表、PPT | Phase 2/5 辅助 | [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) |
| aigc-reduce | 论文降重 | Phase 6 | [xiaofenggan01/aigc-reduce](https://github.com/xiaofenggan01/aigc-reduce) |

### 安装 nature-skills 合集

```bash
# 克隆到固定位置
git clone https://github.com/Yuan1z0825/nature-skills.git ~/ai-skills/nature-skills

# 一键创建所有 agent 文件
mkdir -p ~/.claude/agents

cat > ~/.claude/agents/nature-academic-search.md << 'EOF'
---
name: nature-academic-search
description: Systematic academic literature search
---
When invoked, read `~/ai-skills/nature-skills/skills/nature-academic-search/SKILL.md`.
EOF

cat > ~/.claude/agents/nature-figure.md << 'EOF'
---
name: nature-figure
description: Publication-grade scientific figures
---
When invoked, read `~/ai-skills/nature-skills/skills/nature-figure/SKILL.md`.
EOF
```

### 安装 aigc-reduce（论文降重）

```bash
git clone https://github.com/xiaofenggan01/aigc-reduce.git ~/.claude/skills/aigc-reduce
```

---

## 安装 Python 依赖

用于自动生成格式化的 .docx 文件：

```bash
pip install python-docx
```

---

## 验证安装

```bash
# 检查插件加载
claude --plugin-dir ~/paper-cowork-plugin/

# 或检查永久安装
ls ~/.claude/skills/ | grep paper

# 检查辅助技能
ls ~/.claude/agents/nature-figure.md && echo "nature-figure OK"
ls ~/.claude/skills/aigc-reduce/SKILL.md && echo "aigc-reduce OK"
```

---

## 开始使用

在 Claude Code 中运行：

```
/paper-cowork
```

**首次运行**自动进入初始化流程（创建工作区、放入模板、检测依赖），之后每次自动从断点继续写作。
