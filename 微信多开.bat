@echo off & setlocal EnableDelayedExpansion

title 微信多开
echo ==================== 微信多开工具 ========================
echo 多开前请先关闭微信。

:: 查询注册表中微信的安装路径
for /f "usebackq tokens=3*" %%A in (`reg query "HKEY_CURRENT_USER\Software\Tencent\WeChat" /v InstallPath`) do (
    set "installPath=%%A %%B"
)

if "%installPath%" == "" (
	set /p fileUrl=未获取到微信安装路径，请输入WeChat.exe的绝对路径：
) else (
	echo 成功获取到微信安装路径："%installPath%\WeChat.exe"
	set fileUrl="%installPath%\WeChat.exe"
)

:inputCount
set /p count=请输入多开数量：

for /f "delims=1234567890" %%a in ("%count%@") do if %%a==@ (
	for /l %%a in (1,1,%count%) do (
		echo 正在开启第 %%a 个微信
		start "" %fileUrl%
	)
	echo 多开完成
	pause
) else (
	echo 请输入正确的数字！
	GOTO inputCount
)
