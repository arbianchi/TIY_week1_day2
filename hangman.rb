require "pry"

play = true

while play

  puts "Welcome to Hangman"

  words = ["bonobo", "fishy","birdie"]

  splitword = words.sample.split("")

  # Creates empty answer array
  guessbox = Array.new(splitword.length, " _ ")

  # Empty array for previous guesses
  prevguess = []

  # Print board
  guessbox.each do |i|
    print i
  end
  puts

  guesses = 6

  until guesses == 0 || guessbox.include?(" _ ") == false do
    print "Guess a letter: "
    guess = gets.chomp


    if guess.to_i.to_s == guess || guess.length > 1

      print "Enter one letter you haven't guess yet!\n"

    elsif prevguess.include? guess

      puts "You already guess that!"

    elsif
      index = 0
      splitword.each do |i|
        if i == guess
          guessbox[index] = guess
        end
        index += 1

      end

      # Decrement guess counter
      guesses -= 1

      # Print board
      guessbox.each do |i|
        print i
      end
      puts

      prevguess.push(guess)
      # Prints previous guesses
      print "Previous Guesses\n"
      prevguess.each do |l|
        print  " " + l + " "
      end
      puts

      # Prints remaining guesses
      print "Guess left: #{guesses}\n"

    end
  end

  if splitword == guessbox
    puts "You win!"
  else
    puts "You lose!"" The word was #{splitword}.\n"
    end
  puts "Play again? Enter 'y' for yes or 'q' for quit\n"
  again = gets.chomp.downcase
    if again == 'q'
      play = false
    else again != 'y'
      print "Enter 'y' to play again or 'q' for quit\n"
    end
  end
