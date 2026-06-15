@echo off
chcp 65001 >nul
title paper-cowork 插件安装
echo ============================================
echo    paper-cowork - 本科论文写作助手
echo ============================================
echo.
echo 正在检查环境...
echo.

REM 检查 Claude Code
where claude >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [⚠] 未检测到 Claude Code。
    echo     请先安装: https://code.claude.com
    pause
    exit /b 1
)

echo [✅] Claude Code 已安装
echo.
echo 安装方式：
echo.
echo ─── 方式 1：Plugin 模式（推荐先试用）───
echo   git clone https://github.com/Jonoo-no/paper-cowork.git
echo   cd paper-cowork
echo   claude --plugin-dir ./
echo.
echo ─── 方式 2：永久安装 ───
echo   git clone https://github.com/Jonoo-no/paper-cowork.git %%USERPROFILE%%\paper-cowork-plugin
echo   xcopy /E /I "%%USERPROFILE%%\paper-cowork-plugin\skills\*" "%%APPDATA%%\Claude\skills\"
echo.
echo.
echo 可选依赖：
echo   pip install python-docx
echo.
echo 推荐辅助技能：
echo   https://github.com/Yuan1z0825/nature-skills
echo   https://github.com/xiaofenggan01/aigc-reduce
echo.
echo 安装后重启 Claude，输入 / 即可看到 slash command
echo.
pause
