#!/usr/bin/env ruby

# sleep sort con threads
threads = []
[7,3,2,1,5,4,3,2,1].each do |item|
  threads << Thread.new do
    sleep item
    ### puts "SLEEP SORT: #{item}"
    print "SLEEP SORT: #{item}\n"
  end
end

threads.each { |t| t.join }
puts "LISTO :)"