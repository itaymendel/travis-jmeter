#!/bin/bash

# apt-get install openjdk-6-jre
wget -O jmeter/apache-jmeter-2.11.tgz http://apache.spd.co.il//jmeter/binaries/apache-jmeter-2.11.tgz
tar zxf jmeter/apache-jmeter-2.11.tgz -C jmeter/

jmeter/apache-jmeter-2.11/bin/jmeter -n -t jmeter/test.jmx -l jmeter/results.jtl
gzip jmeter/results.jtl

curl -v https://loadosophia.org/api/file/upload/ -H "X-Loadosophia-Token: `cat .loadosophia.token`" -F "projectKey=DEFAULT" -F "jtl_file=@jmeter/results.jtl.gz"
