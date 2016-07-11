def prompt(message)
  puts "=>#{message}"
end

def invaild_number?(number)
  number.empty? || number.to_f < 0 || number.to_f == 0.0
end

prompt("Welcome to Mortgage Calculator!")
loop do
  amount = ""
  loop do
    prompt("What is the the loan amount")
    amount = gets.chomp
    if invaild_number?(amount)
      prompt("Please enter valid number")
    else
      break
    end
  end

  apr = ""
  loop do
    prompt("What is your APR?")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    apr = gets.chomp
    if invaild_number?(apr)
      prompt("Please enter the valid APR")
    else
      break
    end
  end

  duration = ""
  loop do
    prompt("what is your the loan duration in years")
    duration = gets.chomp
    if invaild_number?(duration)
      prompt("Please enter valid loan duration")
    else
      break
    end
  end

  monthly_interest = apr.to_f / 100 / 12
  months = duration.to_i * 12
  # prompt("Your monthly interest rate is #{monthly_interest.round(3)}")
  monthly_payment = amount.to_f *
                    (monthly_interest * (1 + monthly_interest)**months) /
                    ((1 + monthly_interest)**months - 1)
  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")
  prompt("Another calculation? (Y for yes)")
  calc = gets.chomp
  next if calc.casecmp('y') == 0
  prompt("Thanks for using")
  prompt("Bye-bye")
  break
end
