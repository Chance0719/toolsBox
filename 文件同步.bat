@echo off
set "source_dir=E:\qqwefiles\wechat\WeChat Files\wxid_kb0frtrxqtzz22\FileStorage\File"
set "destination_dir=F:\WechatFile"

xcopy "%source_dir%\*" "%destination_dir%\" /s /i /d
