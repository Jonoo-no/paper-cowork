@echo off
chcp 65001 >nul
title paper-cowork 插件安装
echo ============================================
echo    paper-cowork - 本科论文写作助手
echo ============================================
echo.
echo 正在检查环境...
echo.

REM 检查 Claude Code 是否安装
where claude >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [⚠] 未检测到 Claude Code。
    echo     请先安装 Claude Code: https://code.claude.com
    echo.
    pause
    exit /b 1
)

echo [✅] Claude Code 已安装
echo.
echo 安装方式（任选一种）：
echo.
echo ─── 方式 1：临时加载（推荐先试用） ───
echo   claude --plugin-dir %~dp0
echo.
echo ─── 方式 2：永久安装 ───
echo   xcopy /E /I "%~dp0agents" "%USERPROFILE%\.claude\agents\paper-cowork\"
echo   echo 插件已安装，重启 Claude Code 后可用
echo.
echo ─── 方式 3：从 GitHub 克隆 ───
echo   git clone https://github.com/Jonoo-no/paper-cowork.git
echo   claude --plugin-dir ./paper-cowork
echo.
echo.
echo 可选依赖安装（用于自动生成格式化 .docx）：
echo   pip install python-docx
echo.
echo 推荐安装的辅助技能：
echo   1. nature-figure - 图表生成
echo   2. aigc-reduce - 论文降重
echo   3. nature-academic-search - 英文文献检索
echo.
echo 安装完成后，在 Claude Code 中运行 /启动论文工作区
echo.
pause
