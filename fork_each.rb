#!/usr/bin/env ruby

module ForkEach
  def fork_each(max = 4)
    pids = []
    self.each do |item|
      pids << fork { yield item }
      pids.delete(Process.wait 0) if pids.length >= max
    end
    pids.each { |pid| Process.wait pid }
  end
end

Array.send(:include, ForkEach)
Range.send(:include, ForkEach)

# pseudo ejemplo
(1..10).fork_each do |i|
  s = Random.rand(10)            # poner código
  puts "INI #{i} #{s}"; sleep s  # real aquí
end

# descargas en paralelo
urls =[]
urls << 'www.yahoo.com'
urls << 'www.google.com'
urls << 'www.microsoft.com'
urls << 'www.apple.com'
urls << 'www.amazon.com'

urls.fork_each(3) { |u| `wget -q http://#{u} -O #{u}` }