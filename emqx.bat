REM Deploy EMQ X brokers - create a cluster of 3 nodes

@echo off

mkdir data\emqx1
mkdir data\emqx2
mkdir data\emqx3

REM Create config files

@echo off &setlocal
(for /f "delims=" %%i in (files\emqx.conf) do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        set "line=!line:XXX-EMQX-HOST-XXX=emqx1.docker!"
        echo(!line!
        endlocal
))>data\emqx1\emqx.conf

@echo off &setlocal
(for /f "delims=" %%i in (files\emqx.conf) do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        set "line=!line:XXX-EMQX-HOST-XXX=emqx2.docker!"
        echo(!line!
        endlocal
))>data\emqx2\emqx.conf

@echo off &setlocal
(for /f "delims=" %%i in (files\emqx.conf) do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        set "line=!line:XXX-EMQX-HOST-XXX=emqx3.docker!"
        echo(!line!
        endlocal
))>data\emqx3\emqx.conf

REM Allow all access control permissions
copy files\emqx-acl.conf data\emqx1\acl.conf
copy files\emqx-acl.conf data\emqx2\acl.conf 
copy files\emqx-acl.conf data\emqx3\acl.conf


docker run -itd -v %cd%\data\emqx1\emqx.conf:/opt/emqx/etc/emqx.conf -v %cd%\data\emqx1\acl.conf:/opt/emqx/etc/acl.conf --network brokers --name emqx1.docker %EMQX_IMAGE%
docker run -itd -v %cd%\data\emqx2\emqx.conf:/opt/emqx/etc/emqx.conf -v %cd%\data\emqx2\acl.conf:/opt/emqx/etc/acl.conf --network brokers --name emqx2.docker %EMQX_IMAGE%
docker run -itd -v %cd%\data\emqx3\emqx.conf:/opt/emqx/etc/emqx.conf -v %cd%\data\emqx3\acl.conf:/opt/emqx/etc/acl.conf --network brokers --name emqx3.docker %EMQX_IMAGE%