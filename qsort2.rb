#!/usr/bin/env ruby

# quick sort en ruby multihilo novato
def qsort(list)
  return [] if list.size == 0
  x, *xs = *list
  less, more = xs.partition { |y| y < x }
  ### return qsort(less) + [x] + qsort(more)
  r = []
  t1 = Thread.new { r[0] = qsort(less) }
  t2 = Thread.new { r[1] = qsort(more) }
  t1.join
  t2.join
  return r[0] + [x] + r[1]
end

data = []; File.read('data.txt').scan(/\d+/).each { |x| data << x.to_i }

puts "Ordenando"
ini = Time.new
res = qsort(data)
fin = Time.new
puts "#{fin - ini} secs #{res[0...10]}"
