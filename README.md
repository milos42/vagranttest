

in order to avoid ssh connection problems with Ansible add these lines to the .ssh/config

```Host 127.0.0.1 192.168.222.?
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
```

what you need
==============
  - vagrant installed
  - ansible installed

install the code:
    git clone https://github.com/milos42/vagranttest

```cd vagrantest
vagrant up
ansible-playbook site.yml -i hosts
vagrant ssh db1
vagrant ssh db2```

run the following on each db host:
    /usr/local/bin/sbtest.sh

point your browser to:
http://localhost:8808/RainGauge/

