#!/usr/bin/env ruby

# sleep sort
[7,3,2,1,5,4,3,2,1].each do |item|
  Process.fork do
    sleep item
    puts "SLEEP SORT: #{item}"    
  end
end

Process.waitall
puts "LISTO :)"
