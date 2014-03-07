#!/bin/bash
MYSQL_USER=root
OLTP_TABLE_SIZE=1000000
NUMBER_OF_THREADS=25
TEST_DB='sbtest'
SYSBENCH=`which sysbench`
MYSQL_HOST='localhost'
MYSQL_PASSWD=''

echo "### - CLEANING UP EXISTING DBS"
${SYSBENCH} --test=/usr/share/doc/sysbench/tests/db/oltp.lua --mysql-host=${MYSQL_HOST} --mysql-user=${MYSQL_USER} --mysql-password=${MYSQL_PASSWORD}  --mysql-table-engine=innodb --oltp-table-size=${OLTP_TABLE_SIZE} --max-time=180 --mysql-db=${TEST_DB} --max-requests=0 cleanup

echo "### - PREPARING TEST TABLES (table size = ${OLTP_TABLE_SIZE})"

${SYSBENCH} --test=/usr/share/doc/sysbench/tests/db/oltp.lua --mysql-host=${MYSQL_HOST} --mysql-user=${MYSQL_USER} --mysql-password=${MYSQL_PASSWORD}  --mysql-table-engine=innodb --oltp-table-size=${OLTP_TABLE_SIZE} --max-time=180 --mysql-db=${TEST_DB} --max-requests=0 prepare

echo "### - RUN THE TEST - BE PATIENT ETA: 3-5 MINUTES"

${SYSBENCH} --test=/usr/share/doc/sysbench/tests/db/oltp.lua --mysql-host=${MYSQL_HOST} --mysql-user=${MYSQL_USER} --mysql-password=${MYSQL_PASSWORD}  --mysql-table-engine=innodb --oltp-table-size=${OLTP_TABLE_SIZE} --max-time=180 --mysql-db=${TEST_DB} --max-requests=0 --num-threds=${NUMBER_OF_THREADS} run
