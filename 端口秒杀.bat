@echo off & setlocal EnableDelayedExpansion

title �˿���ɱ
echo ==================== �˿���ɱ���� ========================

:MENU
set /p input=������˿ں�:

set obj[0]=%input%
set port=0
set pid=0

for /f "usebackq delims== tokens=1-2" %%a in (`set obj`) do (
    set port=%%b
	echo ��ʼ���Ҷ˿ںš�!port!����ռ�ý���
    for /f "tokens=5" %%m in ('netstat -aon ^| findstr ":%%b"') do (
        set pid=%%m
    )
    if "!pid!"=="0" (
        echo �˿ںš�!port!��û��ռ��
    ) else (
        echo �˿ںš�!port!��, PID ��!pid!����ؽ�����ɱ��
        taskkill /f /pid !pid!
    )
    set pid=0
)

GOTO MENU