@echo off & setlocal EnableDelayedExpansion

title ΢�Ŷ࿪
echo ==================== ΢�Ŷ࿪���� ========================
echo �࿪ǰ���ȹر�΢�š�

:: ��ѯע�����΢�ŵİ�װ·��
for /f "usebackq tokens=3*" %%A in (`reg query "HKEY_CURRENT_USER\Software\Tencent\WeChat" /v InstallPath`) do (
    set "installPath=%%A %%B"
)

if "%installPath%" == "" (
	set /p fileUrl=δ��ȡ��΢�Ű�װ·����������WeChat.exe�ľ���·����
) else (
	echo �ɹ���ȡ��΢�Ű�װ·����"%installPath%\WeChat.exe"
	set fileUrl="%installPath%\WeChat.exe"
)

:inputCount
set /p count=������࿪������

for /f "delims=1234567890" %%a in ("%count%@") do if %%a==@ (
	for /l %%a in (1,1,%count%) do (
		echo ���ڿ����� %%a ��΢��
		start "" %fileUrl%
	)
	echo �࿪���
	pause
) else (
	echo ��������ȷ�����֣�
	GOTO inputCount
)
