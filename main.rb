require './model/app'

def main
  app = App.new
  puts ''
  puts '             OOP SCHOOL LIBRARY'
  puts '----------------------------------------------------'
  loop do
    app.introduction
    input = gets.chomp

    if (1..6).include?(input.to_i)
      app.trigger(input)
    else
      puts 'Thank you for using the OOP school library'
      break
    end
  end
end

main
