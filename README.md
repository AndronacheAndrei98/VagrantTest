# VagrantTest: https://github.com/AndronacheAndrei98/VagrantTest

A.Local machine dependencies:
Before starting our VagrantTest please make sure the following steps are done on your machine:
- Run the terminal as administrator for all activities involving Vagrant
- Install Vagrant: https://www.vagrantup.com/downloads.html
- Install Oracle Virtual Box: https://www.virtualbox.org/
- Install Oracle Virtual Box Extension Pack: https://download.virtualbox.org/virtualbox/7.1.8/Oracle_VirtualBox_Extension_Pack-7.1.8.vbox-extpack 
- Instaleaza net-tools vm-uri + modifica porturi vm-uri
- In the project folder, please run "vagrant up" in order to setup all three virtual machines


B.When settings up the "VmManual" virtual machine you will need to do the following:
- Connect via ssh to the machine by using:
"vagrant ssh VmManual"

- After connecting please install Docker by running the commands bellow(Updated instructions here: https://docs.docker.com/engine/install/ubuntu/):
1. Uninstall all conflicting packages:
"for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done"

2. Add Docker's official GPG key:
"sudo apt-get update"
"sudo apt-get install ca-certificates curl"
"sudo install -m 0755 -d /etc/apt/keyrings"
"sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc"
"sudo chmod a+r /etc/apt/keyrings/docker.asc"

3. Add the repository to Apt sources:
"echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"
"sudo apt-get update"

4. Install the latest version, run:
 "sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"

5. Verify that the installation is successful by running the hello-world image:
"sudo docker run hello-world"

- After installing Docker, please do the following:
1. Add the vagrant user to the docker group"
"sudo usermod -aG docker vagrant"

2. Exit the virtual machine:
"exit"

3. SSH again:
"vagrant ssh VmManual"

4. Go to the "dockerConfig" folder by using:
"cd dockerConfig/"

5. Build the Docker image:
"docker build -t cat_test:0.1 ."

6. Run the Docker image:
"docker run --name catTest1 --rm cat_test:0.1"

7. If the output looks like this then everything was setup correctly:
"
vagrant@VmManual:~/dockerConfig$ docker run --name catTest1 --rm cat_test:0.1
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Connected to 192.168.56.11:6379.
Ncat: 0 bytes sent, 0 bytes received in 0.02 seconds.
Redis VM is up
Ncat: Version 7.92 ( https://nmap.org/ncat )
Ncat: Connected to 192.168.56.12:3306.
Ncat: 0 bytes sent, 0 bytes received in 0.01 seconds.
MariaDB VM is up
"