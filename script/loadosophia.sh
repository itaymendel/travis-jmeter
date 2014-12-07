#!/bin/bash

mkdir jmeter
wget -O jmeter/apache-jmeter-2.12.tgz http://apache.spd.co.il//jmeter/binaries/apache-jmeter-2.12.tgz -q
tar zxf jmeter/apache-jmeter-2.12.tgz -C jmeter/
jmeter/apache-jmeter-2.12/bin/jmeter -n -t test/backend.jmx -l -Jhost=localhost
gzip results.jtl
curl https://loadosophia.org/api/file/upload/ -H "X-Loadosophia-Token: `cat .loadosophia.token`" -F "projectKey=DEFAULT" -F "jtl_file=@results.jtl.gz"
