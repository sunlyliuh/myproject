#!/bin/bash
#
# php job ps warning
#
# @author lijie
# @date   2015.3.28

ips=(
    172.16.70.14
    172.16.70.174
    172.21.70.12
    172.21.70.14
);

for ip in ${ips[@]}; do
    # ps
    ssh $ip "ps max -o lstart,cmd | grep /usr/local/php/bin/php | grep -v 'sh -c ps max -o lstart,cmd' | grep -v 'grep /usr/local/php/bin/php'" > $ip.ps
    scp $ip.ps 172.16.70.176:/home/lijie/php/phpjob
    #rm -f $ip.ps
    
    # log: exception
    ssh $ip "cd /usr/local/www/crm/syslogs/`date +%Y-%m`/`date +%d`; grep -i exception * | grep -iv exceptional | grep -iv exceptionnel | grep -iv 'exception,crown'" > $ip.log
    scp $ip.log 172.16.70.176:/home/lijie/php/phpjob

    # log: edm err:
    ssh $ip "cd /usr/local/www/crm/syslogs/`date +%Y-%m`/`date +%d`; grep -i 'err:' *" >> $ip.log
    scp $ip.log 172.16.70.176:/home/lijie/php/phpjob
    #rm -f $ip.log
done
