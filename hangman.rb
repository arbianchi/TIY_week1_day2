require "pry"

puts "Welcome to Hangman"

words = ["bonobo"]

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

until guesses < 0 || guessbox.include?(" _ ") == false do
  print "Guess a letter: "
  guess = gets.chomp


  if guess.to_i.to_s == guess || guess.length > 1

    print "Enter one letter you haven't guess yet!\n"

  elsif prevguess.include? guess

    puts "You already guess that!"

  else
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
    print "Guess left: #{guesses}\n"
  end
end

if splitword == guessbox
  puts "You win!"
else
  puts "You lose!"
end
