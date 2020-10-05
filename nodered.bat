REM deploy Node-RED instance to test brokers

@echo off

mkdir data\nodered

copy files\flows.json data\nodered\flows.json
copy files\config.json data\nodered\.config.json
copy files\flows_cred.json data\nodered\flows_cred.json

docker run -itd -p 1880:1880 -v %cd%\data\nodered:/data --network brokers --name nodered %NODERED_IMAGE%
