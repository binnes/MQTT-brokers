REM Deploy Mosquitto brokers

@echo off

mkdir data\mosquitto1\config
mkdir data\mosquitto1\data
mkdir data\mosquitto1\log
mkdir data\mosquitto2\config
mkdir data\mosquitto2\data
mkdir data\mosquitto2\log
mkdir data\mosquitto3\config
mkdir data\mosquitto3\data
mkdir data\mosquitto3\log

REM create password file with users dev01, app01, app02 and app03 all with password passw0rd
docker run -itd -v %cd%:/data --network brokers --name mosquitto1 %MOSQUITTO_IMAGE%
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -c -b /data/passwd dev01 passw0rd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd app01 passw0rd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd app02 passw0rd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd app03 passw0rd
docker kill mosquitto1
docker rm mosquitto1

copy passwd data\mosquitto1\config\passwd
copy passwd data\mosquitto2\config\passwd
move passwd data\mosquitto3\config\passwd

REM create config file and copy to all 3 images
copy files\mosquitto1.conf data\mosquitto1\config\mosquitto.conf
copy files\mosquitto2.conf data\mosquitto2\config\mosquitto.conf
copy files\mosquitto3.conf data\mosquitto3\config\mosquitto.conf

REM run 3 brokers, named mosquitto1, mosquitto2 and mosquitto3
docker run -itd -v %cd%\data\mosquitto1\config:/mosquitto/config -v %cd%\data\mosquitto1\data:/mosquitto/data -v %cd%\data\mosquitto1\log:/mosquitto/log --network brokers --name mosquitto1 %MOSQUITTO_IMAGE%
docker run -itd -v %cd%\data\mosquitto2\config:/mosquitto/config -v %cd%\data\mosquitto2\data:/mosquitto/data -v %cd%\data\mosquitto2\log:/mosquitto/log --network brokers --name mosquitto2 %MOSQUITTO_IMAGE%
docker run -itd -v %cd%\data\mosquitto3\config:/mosquitto/config -v %cd%\data\mosquitto3\data:/mosquitto/data -v %cd%\data\mosquitto3\log:/mosquitto/log --network brokers --name mosquitto3 %MOSQUITTO_IMAGE%
