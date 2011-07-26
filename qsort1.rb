#!/usr/bin/env ruby

# quick sort en ruby
def qsort(list)
  return [] if list.size == 0
  x, *xs = *list
  less, more = xs.partition { |y| y < x }
  return qsort(less) + [x] + qsort(more)
end

data = []; File.read('data.txt').scan(/\d+/).each { |x| data << x.to_i }

puts "Ordenando"
ini = Time.new
res = qsort(data)
fin = Time.new
puts "#{fin - ini} secs #{res[0...10]}"
