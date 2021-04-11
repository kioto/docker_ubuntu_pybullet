FOR /F %%i in ('python -c "import socket; print(socket.gethostbyname(socket.gethostname()))"') DO @SET IPADDR=%%i

docker run -it -d --name ubuntu_pybullet-1 -p 8889:8888 ^
	-e DISPLAY=%IPADDR%:0.0 ^
	-v %~dp0/work:/home/devuser/share ^
       	ubuntu_pybullet
