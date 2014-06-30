
answers = 0
choice = ''
initial_choice = ''
question_array = []
choice_array = []
answer_array = []
explanation_array = []
i = 0
j = 0

puts "What section would you like to study?: "
puts "a) Human Growth and Development \nb) Social and Cultural Foundations \nc) Theories of Counseling and the Helping Relationship \nd) Groups \ne) Lifestyle and Career Development \nf) Appraisal \ng) Research and Program Evaluation \nh) Professional Orientation and Ethics \ni) Counseling Families, Diagnosis, and Advanced Concepts"
inital_choice = gets.chomp

if inital_choice == 'a'
  file = "hgd_questions.txt"
else
  puts "not yet finished"
end

File.open(file) do |f|
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

puts " "
puts "type 'q' anytime to quit" 

while i < question_array.length do
  puts " "
  puts "Question " + (i+1).to_s + ": "
  puts " "
  puts question_array[i]
  puts " "
  puts choice_array[j..j+3]
  puts "Your answer?: "
  answer = gets.chomp
  if answer == 'q'
    break
  elsif answer.eql? answer_array[i]
    puts " "
    puts "Correct!"
    answers += 1
  else
    puts " "
    puts "Wrong, the answer is: " + answer_array[i]
    puts "Would you like to see an explanation? "
    choice = gets.chomp
    if choice == 'y'
        puts explanation_array[i]
        puts "PRESS ENTER TO CONTINUE"
        gets.chomp
    end
  end

  i += 1
  j += 4
end

puts " TOTAL SCORE: "
puts ((answers.to_f/question_array.length) * 100).round.to_s + "%"
puts "You got " + answers.to_s + " answers correct out of " + question_array.length.to_s + " total questions"