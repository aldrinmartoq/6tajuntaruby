#!/usr/bin/env ruby

# quick sort en ruby multihilo principiante
def qsort(list, level = 0)
  return [] if list.size == 0
  x, *xs = *list
  less, more = xs.partition { |y| y < x }

  r = []
  if (level < 4)
    t1 = Thread.new { r[0] = qsort(less, level + 1) }
    t2 = Thread.new { r[1] = qsort(more, level + 1) }
    t1.join
    t2.join
  else
    r[0] = qsort(less, level + 1)
    r[1] = qsort(more, level +1)
  end
  return r[0] + [x] + r[1]
end

data = []; File.read('data.txt').scan(/\d+/).each { |x| data << x.to_i }

puts "Ordenando"
ini = Time.new
res = qsort(data)
fin = Time.new
puts "#{fin - ini} secs #{res[0...10]}"
