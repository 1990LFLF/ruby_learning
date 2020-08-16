def time(array)
  start = Time.now
  yield(array)
  finish = Time.now
  (finish - start) * 1000
end

puts "Número de elementos do array: "
max_num = gets.chomp.to_i

puts "Número de iterações:"
iterations = gets.chomp.to_i

test_1 = "Test 1 | Operation: multiplicar cada elemento por ele mesmo convertendo array"

time_map = []
time_for = []

counter = 0
while counter < iterations
  # criando os arrays
  my = (1..max_num).to_a
  my_3 = (1..max_num).to_a

  # execução
  a = time(my) do |teste|
    teste.map! { |num| num * num }
  end

  time_map << a

  b = time(my_3) do |array|
    for i in 0...max_num
    my_3[i] = my_3[i] * my_3[i]
    end
  end

  time_for << b

  counter += 1
end

puts "Checando se os arrays realmente mudaram de valor.\n"
puts "Últimos quatro valores dos arrays após sair das iterações\n"
print my[-4..-1]
puts "\n"
print my_3[-4..-1]
puts "\n"

def avg(array)
  array.reduce(0.0) { |sum, elem| sum + elem } / array.size
end

avg_map = avg(time_map)
avg_for = avg(time_for)

puts "-----------------------TIME TESTS RESULTS-------------------------"
puts "PARAMETERS:\n-Array com #{max_num} elementos\n-#{iterations} iterações"
puts "\n"
puts test_1
puts "\n"
puts "time in ms - miliseconds"
puts "\n"
puts "Test #1a\nMethod: .map!\n-average_time: #{avg_map}\n-max: #{time_map.max}\n-min: #{time_map.min}"
puts "\n"
puts "Test #1b\nMethod: mesma operação usando loop for\n-average_time: #{avg_for}\n-max: #{time_for.max}\n-min: #{time_for.min}"
puts "\n"
puts "Conclusão:\nMétodo map! levou #{(100 * (avg_map / avg_for)).round(2)}\% do tempo que o 'for' levou"
