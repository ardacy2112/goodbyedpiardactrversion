@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo Goodbyedpi by ardac tr made new version
echo Right click - run as administrator.
echo Adminde yönetici çalıştır yani ki iyi bir şekilde kurulsun.
echo son olarak bazen bazı sitlerde (örneğin github)kasma donma yapabiliyor kusura bakmayın kasma donma olursa.
echo Yeni versiyon Cloudflare DNS'li haberiniz olsun yakında diğer dnsli versiyonlar yapilacaktir.

pause
sc stop "GoodbyeDPI"
sc delete "GoodbyeDPI"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -6 --set-ttl 6 --dns-addr 8.8.8.8 --dns-port 53 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 53" start= "auto"
sc description "GoodbyeDPI" "Passive Deep Packet Inspection blocker and Active DPI circumvention utility"
sc start "GoodbyeDPI"

POPD
