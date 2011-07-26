#!/usr/bin/env macruby
# coding: utf-8

def qsort(list, level = 0)
  return [] if list.size == 0
  return list if list.size == 1
  x, *xs = *list
  less, more = xs.partition { |y| y < x }
  rs = []
  
  if level < 4
    group = Dispatch::Group.new
    req_q = Dispatch::Queue.new("rs.#{rs.object_id}")
    Dispatch::Queue.concurrent.async(group) do
      q1 = qsort(less, level + 1)
      req_q.async(group) { rs[0] = q1 }
    end
    Dispatch::Queue.concurrent.async(group) do
      q2 = qsort(more, level + 1)
      req_q.async(group) { rs[1] = q2 }
    end
  
    group.wait
  else
    rs[0] = qsort(less, level + 1)
    rs[1] = qsort(more, level + 1)
  end
  return rs[0] + [x] + rs[1]
end

data = []; File.read('data.txt').scan(/\d+/).each { |x| data << x.to_i }

puts "Ordenando"
ini = Time.new
res = qsort(data)
fin = Time.new
puts "#{fin - ini} secs #{res[0...10]}"
