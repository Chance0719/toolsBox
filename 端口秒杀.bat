@echo off & setlocal EnableDelayedExpansion

title 端口秒杀
echo ==================== 端口秒杀工具 ========================

:MENU
set /p input=请输入端口号:

set obj[0]=%input%
set port=0
set pid=0

for /f "usebackq delims== tokens=1-2" %%a in (`set obj`) do (
    set port=%%b
	echo 开始查找端口号【!port!】所占用进程
    for /f "tokens=5" %%m in ('netstat -aon ^| findstr ":%%b"') do (
        set pid=%%m
    )
    if "!pid!"=="0" (
        echo 端口号【!port!】没有占用
    ) else (
        echo 端口号【!port!】, PID 【!pid!】相关进程以杀死
        taskkill /f /pid !pid!
    )
    set pid=0
)

GOTO MENU