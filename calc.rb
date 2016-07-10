puts "cals"
puts "input the number 1"
no1 = gets.chomp
puts "input the number 2"
no2 = gets.chomp

puts "what do you want 1+ 2- 3* 4/"
calc = gets.chomp

if calc == "1"
  result = no1.to_i + no2.to_i
elsif calc == "2"
  result = no1.to_i - no2.to_i
elsif calc == "3"
  result = no1.to_i * no2.to_i
else
  result = no1.to_f / no2.to_f
end

puts "result the #{result}"