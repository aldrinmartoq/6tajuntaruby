#!/usr/bin/env ruby

require 'getoptLong'

file = "data.txt"
numb = 1000000 # 10m
read = false

opts = GetoptLong.new(
  [ '--numb', '-n', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--file', '-f', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--read', '-r', GetoptLong::NO_ARGUMENT ]
)

opts.each do |opt, arg|
  case opt
  when '--numb'
    numb = arg.to_i
  when '--file'
    file = arg
  when '--read'
    read = true
  end
end

if read
  # data = Marshal.load(open(file).read)
  data = File.read(file).scan(/\d+/)
  puts "Leyendo #{file} (#{data.length})"
  puts data.to_s
else
  data = []
  numb.times { data << Random.rand(numb) }
  puts "Escribiendo #{file} (#{data.length})"
  open(file, 'w') { |f| data.each { |d| f.puts d } }
end