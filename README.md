http://localhost:8808/RainGauge/

in order to avoid ssh connection problems with Ansible add these lines to the .ssh/config

Host 127.0.0.1 192.168.222.?
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null

===========
vagranttest
===========

