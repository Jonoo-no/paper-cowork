# 下载与安装指南

本文档说明如何完整安装 paper-cowork 插件及其推荐的辅助技能。

---

## 一、安装 paper-cowork 插件

### 方式 1：Git 克隆（推荐）

```bash
git clone https://github.com/Jonoo-no/paper-cowork.git
cd paper-cowork
```

### 方式 2：下载 ZIP

1. 打开 [https://github.com/Jonoo-no/paper-cowork](https://github.com/Jonoo-no/paper-cowork)
2. 点击绿色按钮 **Code** → **Download ZIP**
3. 解压到本地文件夹

### 加载方式

```bash
# 临时加载（每次都要运行）
claude --plugin-dir ./paper-cowork/

# 或永久安装（将 agents 复制到 .claude/agents/）
cp -r paper-cowork/agents/* ~/.claude/agents/
```

---

## 二、安装可选依赖技能（推荐）

这些技能不是必需的，但安装后可以获得更完整的功能。

### 依赖总览

| 技能 | 用途 | 优先级 | 对应仓库 |
|------|------|--------|---------|
| nature-skills 合集 | 文献检索、图表、润色、PPT | ⭐ 推荐 | [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) |
| aigc-reduce | 论文降重 | ⭐ 推荐 | [xiaofenggan01/aigc-reduce](https://github.com/xiaofenggan01/aigc-reduce) |

---

### 2.1 安装 nature-skills 合集

nature-skills 由上海交通大学的袁一哲（Yuan1z0825）创建，包含以下 10 个技能：

| 技能名 | 用途 | paper-cowook 中调用阶段 |
|--------|------|------------------------|
| `nature-academic-search` | 多源学术文献搜索 | Phase 2：英文文献补充检索 |
| `nature-figure` | 科研图表生成 | Phase 5：数据可视化 |
| `nature-polishing` | 英文润色 | Phase 5：英文摘要润色 |
| `nature-paper2ppt` | 论文转 PPT | 可选：答辩准备 |
| `nature-writing` | Nature 风格写作 | 参考（本科论文不直接使用） |
| `nature-citation` | CNS 引用检索 | 参考 |
| `nature-data` | 数据可用性声明 | 本科论文不适用 |
| `nature-reader` | 论文双语阅读 | 辅助阅读 |
| `nature-response` | 审稿回复 | 参考 |
| `nature-reviewer` | 预审稿模拟 | 参考 |

#### 安装命令

```bash
# 步骤 1：克隆仓库
git clone https://github.com/Yuan1z0825/nature-skills.git ~/ai-skills/nature-skills

# 步骤 2：创建 agent 文件（每个 skill 一个）
mkdir -p ~/.claude/agents

# nature-academic-search
cat > ~/.claude/agents/nature-academic-search.md << 'EOF'
---
name: nature-academic-search
description: Use proactively for systematic academic literature search, retrieval, and synthesis following Nature-journal search methodology.
---
When invoked, first read `~/ai-skills/nature-skills/skills/nature-academic-search/SKILL.md`.
Treat that file as the governing workflow.
EOF

# nature-figure
cat > ~/.claude/agents/nature-figure.md << 'EOF'
---
name: nature-figure
description: Use proactively for figure creation, formatting, color-scheme advice, and visual presentation following Nature journal guidelines.
---
When invoked, first read `~/ai-skills/nature-skills/skills/nature-figure/SKILL.md`.
EOF

# nature-polishing
cat > ~/.claude/agents/nature-polishing.md << 'EOF'
---
name: nature-polishing
description: Use proactively for Nature-style academic polishing, restructuring, or Chinese-to-English manuscript refinement.
---
When invoked, first read `~/ai-skills/nature-skills/skills/nature-polishing/SKILL.md`.
EOF

# nature-paper2ppt
cat > ~/.claude/agents/nature-paper2ppt.md << 'EOF'
---
name: nature-paper2ppt
description: Build a complete Nature-style Chinese PPTX presentation from a scientific paper.
---
When invoked, first read `~/ai-skills/nature-skills/skills/nature-paper2ppt/SKILL.md`.
EOF

# 可选：其他 skill
# nature-writing, nature-citation, nature-reader, nature-reviewer, nature-response, nature-data
```

一键脚本（复制以下全部内容到终端执行）：

```bash
# === nature-skills 一键安装 ===
REPO_URL="https://github.com/Yuan1z0825/nature-skills.git"
INSTALL_DIR="$HOME/ai-skills/nature-skills"

echo "正在克隆 nature-skills..."
git clone "$REPO_URL" "$INSTALL_DIR" 2>/dev/null || (cd "$INSTALL_DIR" && git pull)

echo "正在创建 agent 文件..."
mkdir -p "$HOME/.claude/agents"

SKILLS=(
  "nature-academic-search:Use proactively for systematic academic literature search"
  "nature-figure:Use proactively for figure creation, formatting, and visual presentation"
  "nature-polishing:Use proactively for Nature-style academic polishing"
  "nature-paper2ppt:Build a complete Nature-style Chinese PPTX presentation"
  "nature-writing:Use proactively for academic manuscript writing"
  "nature-citation:Add strict Nature/CNS citations to manuscript text"
  "nature-reader:Build full-paper bilingual Markdown readers"
  "nature-response:Draft point-by-point reviewer response letters"
  "nature-reviewer:Simulate a Nature-style reviewer assessment"
  "nature-data:Prepare Nature-ready Data Availability statements"
)

for skill in "${SKILLS[@]}"; do
  name="${skill%%:*}"
  desc="${skill#*:}"
  cat > "$HOME/.claude/agents/$name.md" << SKILLEOF
---
name: $name
description: $desc
---
When invoked, first read \`$INSTALL_DIR/skills/$name/SKILL.md\`.
Treat that file as the governing workflow.
SKILLEOF
  echo "  ✅ $name"
done

echo "完成！重启 Claude Code 后即可使用 /$name 调用。"
```

---

### 2.2 安装 aigc-reduce（论文降重）

由 xiaofenggan01 创建的 AIGC 降重技能，在 Phase 6 中使用。

```bash
# 克隆到 skills 目录
git clone https://github.com/xiaofenggan01/aigc-reduce.git ~/.claude/skills/aigc-reduce

# 创建 agent 文件
cat > ~/.claude/agents/aigc-reduce.md << 'EOF'
---
name: aigc-reduce
description: AIGC 降重 Skill — 诊断器、规划器和执行器
---
When invoked, first read `~/.claude/skills/aigc-reduce/SKILL.md`.
Treat that file as the governing workflow.
EOF
```

---

## 三、安装 Python 依赖（用于自动生成 .docx）

```bash
pip install python-docx
```

---

## 四、验证安装

运行以下命令检查是否正确安装：

```bash
# 列出已安装的 agents
ls ~/.claude/agents/

# 检查关键文件
ls ~/.claude/agents/nature-academic-search.md && echo "✅ nature-academic-search"
ls ~/.claude/agents/nature-figure.md && echo "✅ nature-figure"
ls ~/.claude/agents/aigc-reduce.md && echo "✅ aigc-reduce"
ls ~/.claude/skills/aigc-reduce/SKILL.md && echo "✅ aigc-reduce skills"
ls ~/ai-skills/nature-skills/skills/nature-figure/SKILL.md && echo "✅ nature-skills"

# 测试插件加载
claude --plugin-dir ./paper-cowork/
```

---

## 五、开始使用

```bash
# 1. 初始化工作区（仅首次）
/启动论文工作区

# 2. 开始论文写作
/论文流水线
```
