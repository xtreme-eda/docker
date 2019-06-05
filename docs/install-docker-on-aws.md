Install Docker on AWS EC2 RedHat/Centos
- On AWS the free-tier linux box is actually a RedHat machine
  - Red Hat Enterprise Linux 8
--- 

Follow
- https://docs.docker.com/install/linux/docker-ce/centos/
- Fix error
  - Error: Package: 3:docker-ce-18.09.5-3.el7.x86_64 (docker-ce-stable)
    - Requires: container-selinux >= 2.9
    - Follow https://stackoverflow.com/questions/45272827/docker-ce-on-rhel-requires-container-selinux-2-9
      - Or in short
      - sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.74-1.el7.noarch.rpm
- Redo https://docs.docker.com/install/linux/docker-ce/centos/

Allow default user to run docker
- sudo usermod -aG docker ec2-user
