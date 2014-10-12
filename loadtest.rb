require 'rubygems'
require 'ruby-jmeter'

test do
  threads count: 10, continue_forever: true, duration: 3 do
    visit name: 'Hello World', url: 'http://locahost/hi'
  end
end.run(
  path: 'jmeter/apache-jmeter-2.11/bin/',
  file: 'jmeter/test.jmx',
  log: 'jmeter/jmeter.log',
  jtl: 'jmeter/results.jtl')
