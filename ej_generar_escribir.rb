# generar números aleatorios
numb = 1000000 # 1m
data = []
numb.times { data << Random.rand(numb) }

# escribir números a un archivo
file = "data.txt"
puts "Escribiendo #{file} (#{data.length})"
open(file, 'w') { |f| data.each { |d| f.puts d } }
