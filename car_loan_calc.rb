def prompt(message)
  puts "=>#{message}"
end

def vaild_number?(number)
  number.empty? || number.to_f < 0 || number.to_i == 0

end


prompt("Welcome to Mortgage Calculator!")
loop do 
  amount = ""
  loop do
    prompt("What is the the loan amount")
    amount = gets.chomp
    unless vaild_number?(amount)
      break
    else
      prompt("Please enter valid number")
    end
  end

  apr = ""
  loop do
    prompt("what is your What is your APR?")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    apr = gets.chomp
    unless vaild_number?(apr)
      break
    else
      prompt("Please enter the valid APR")
    end
  end

  duration = ""
  loop do
    prompt("what is your the loan duration in years")
    duration = gets.chomp
    unless vaild_number?(duration)
      break
    else
      prompt("Please enter valid loan duration")
    end
  end

  monthly_interest = apr.to_f / 100 / 12
  months = duration.to_i * 12
  # prompt("Your monthly interest rate is #{monthly_interest.round(3)}")
  monthly_payment = amount.to_f *
                    (monthly_interest * (1 + monthly_interest)**months) /
                    ((1 + monthly_interest)**months - 1)
  prompt("Your monthly payment is #{sprintf("%.3f" , monthly_payment)}")
  prompt("Another calculation? (Y for yes)")
  calc = gets.chomp
  unless calc.downcase == "y"
    prompt("Thanks for using")
    prompt("Bye-bye")
    break
  end
end