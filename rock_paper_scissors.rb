VAILD_INPUT = %w(rock paper scissors spock lizard)
INPUT = { r: "rock", p: "paper", s: "scissors", v: "spock", l: "lizard" }
WIN_CONDITION = {
  r: %w(scissors lizard),
  p: %w(rock spock),
  s: %w(paper lizard),
  v: %w(rock scissors),
  l: %w(paper spock)
}

def prompt(message)
  puts "=> #{message}"
end

def display_result(player_score, computer_score)
  if player_score > computer_score
    prompt("You Win 5 times, You are the winner")
  else
    prompt("computer win 5 times, computer is the winner")
  end
end

def result_record(player_choice, computer_choice, score)
  if WIN_CONDITION[player_choice.to_sym].include?(computer_choice)
    score[:player] += 1
    prompt("You Win!!")
  elsif INPUT[player_choice.to_sym] == computer_choice
    prompt("Tie!!")
  else
    score[:computer] += 1
    prompt("You Lose!!")
  end
end

loop do
  player_choice = ''
  computer_choice = ''
  score = { player: 0, computer: 0 }
  prompt("Get 5 point to win")
  loop do
    if score[:player] < 5 && score[:computer] < 5
      prompt("Your score: #{score[:player]}," \
        "Computer's score: #{score[:computer]}")
      prompt("Choose one: r as rock, p as paper," \
        " s as scissors, v as spock, l as lizard")
      player_choice = gets.chomp.downcase
      computer_choice = VAILD_INPUT.sample
      if INPUT.key?(player_choice.to_sym)
        prompt("You choose #{INPUT[player_choice.to_sym]}," \
          "computer choose #{computer_choice}")
        result_record(player_choice, computer_choice, score)
      else
        prompt("Please enter r as rock, p as paper,"  \
          "s as scissors, v as spock, l as lizard")
      end
    else
      break
    end
  end

  display_result(score[:player], score[:computer])
  prompt("Do you want to play again? (Y for yes)")
  input = gets.chomp
  unless input.casecmp('y') == 0
    prompt("Bye-bye")
    break
  end
end
