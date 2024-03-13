# qt-template
C++ qt template relying on either Cmake or qmake.


### Environement 

- local : windows;
- host:  linux server with docker container;
- interface: VcXsrv, Xming or MobaXterm;

For this example we will be using MobaXterm;

### Setup

Install x 11 on your linux server 
```bash
sudo apt install x11-xserver-utils
```

Build the image: 
```bash
docker build -t qt-dev-env .
```

### Compile and your program


- from MobaXterm, remote connect to your server using ssh.

```bash
ssh -X server@ip_address
```

MobaXterm will greet you and tell you you which address your display is set at:
```md
      ____________________________________________________________________
     │                • MobaXterm Personal Edition v24.0 •                
     │              (X server, SSH client and network tools)              
     │                                                                    
     │ ⮞ Your computer drives are accessible through the /drives path     
     │ ⮞ Your DISPLAY is set to 192.168.X.XXX:X.X                         
     │ ⮞ When using SSH, your remote DISPLAY is automatically forwarded   
     │ ⮞ Each command status is specified by a special symbol (✓ or ✗)   
     │                                                                    
     │ • Important:                                                       
     │ This is MobaXterm Personal Edition. The Professional edition       
     │ allows you to customize MobaXterm for your company: you can add    
     │ your own logo, your parameters, your welcome message and generate  
     │ either an MSI installation package or a portable executable.       
     │ We can also modify MobaXterm or develop the plugins you need.      
     │ For more information: https://mobaxterm.mobatek.net/download.html  
     └────────────────────────────────────────────────────────────────────
```

Set the X server connections from the Docker container.
```bash
xhost +local:192.168.X.XXX
```
In case of trouble use 
```bash
xhost +local:docker
```
Run the docker container, 
```bash
sudo docker run -it -e DISPLAY=192.168.X.XXX:X.X -v /tmp/.X11-unix:/tmp/.X11-unix -v the/path/to/your/dir/:/workspace qt-dev-env
```

#### From the root dir, Compile using qmake

Create the Makefile
```bash
qmake helloqt.pro
```
Compile your project
```bash
make
```
Run the program
```bash
./helloqt
```

#### Or use Cmake:

Create the moc file
```bash
moc include/mainwindow.h -o src/moc_mainwindow.cpp
```
Build the project
```bash
cmake -S . -B build & cd build/
```
Compile your project
```bash
make
```
Run the program
```bash
./helloqt
```

When you are done, ``exit`` the container and then run
```bash
xhost -local:docker
xhost -local:192.168.X.XXX
```