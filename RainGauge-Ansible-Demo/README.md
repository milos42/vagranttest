


what you need
==============
  - vagrant installed
  - ansible installed

install the code:
```bash
git clone https://github.com/milos42/vagranttest
```

then run the following 
```
cd vagrantest
vagrant up
````
after the playbook is finished log in to the db hosts in a separate window with:
```
vagrant ssh db1
vagrant ssh db2
```
run the following on each db host:
```
/usr/local/bin/sbtest.sh
```
....wait....

point your browser to:

http://localhost:8808/RainGauge/

