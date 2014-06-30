
answers = 0
choice = ''
question_array = []
choice_array = []
answer_array = []
explanation_array = []

i = 0
j = 0

File.open("questions.txt") do |f|
  inQuestion = false
  inChoices = false
  inAnswer = false
  inExplanation = false

  f.each_line do |line|
    if inQuestion
      if line.strip == ""
        inQuestion = false
      else
        question_array << line
      end
    elsif inChoices
      if line.strip == ""
        inChoices = false
      else
        choice_array << line
      end
    elsif inAnswer
      if line.strip == ""
        inAnswer = false
      else
        answer_array << line.strip
      end
    elsif inExplanation
      if line.strip == ""
        inExplanation = false
      else
        explanation_array << line
      end
    elsif line.strip == "question"
      inQuestion = true
    elsif line.strip == "choices"
      inChoices = true
    elsif line.strip == "answer"
      inAnswer = true
    elsif line.strip == "explanation"
      inExplanation = true
    end
  end
end

while i < question_array.length do
  puts "Question " + (i+1).to_s + ": "
  puts " "
  puts question_array[i]
  puts "Multiple Choice: "
  puts choice_array[j..j+3]
  answer = gets.chomp
  if answer.eql? answer_array[i]
    puts " "
    puts "Correct!"
    puts " "
    answers += 1
  else
    puts " "
    puts "Wrong, the answer is: " + answer_array[i]
    puts "Would you like to see an explanation? "
    choice = gets.chomp
    if choice == 'y'
        puts explanation_array[i]
    end
  end

  i += 1
  j += 4
end

puts "You got " + answers.to_s + " answers correct out of " + question_array.length.to_s + " total questions"