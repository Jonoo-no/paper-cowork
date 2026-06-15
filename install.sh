#!/usr/bin/env bash
set -e

echo "============================================"
echo "   paper-cowork - 本科论文写作助手"
echo "============================================"
echo ""

# 检查 Claude Code
if ! command -v claude &> /dev/null; then
    echo "[⚠] 未检测到 Claude Code。"
    echo "     请先安装: https://code.claude.com"
    exit 1
fi

echo "[✅] Claude Code 已安装"
echo ""
echo "安装方式："
echo ""
echo "─── 方式 1：Plugin 模式（推荐先试用）───"
echo "  git clone https://github.com/Jonoo-no/paper-cowork.git"
echo "  cd paper-cowork"
echo "  claude --plugin-dir ./"
echo ""
echo "─── 方式 2：永久安装 ───"
echo "  git clone https://github.com/Jonoo-no/paper-cowork.git ~/paper-cowork-plugin"
echo "  cp -r ~/paper-cowork-plugin/skills/* ~/.claude/skills/"
echo ""
echo ""
echo "可选依赖："
echo "  pip install python-docx"
echo ""
echo "推荐辅助技能："
echo "  https://github.com/Yuan1z0825/nature-skills"
echo "  https://github.com/xiaofenggan01/aigc-reduce"
echo ""
echo "安装后重启 Claude，输入 / 即可看到 slash command"
