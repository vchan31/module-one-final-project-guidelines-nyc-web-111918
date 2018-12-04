require_relative '../config/environment'

def get_user_input
  gets.chomp.strip
end
#press enter to quit out of current method
system("clear")
quit = nil
puts "Welcome to !!!!!"

until quit
  # system("clear")
  puts "Please select what you would like to do"
  puts "zip | quit"
  user_input = get_user_input

  case user_input
  when "zip"
    system("clear")
    puts "please enter a zip code"
    zip = get_user_input.to_i
    puts User.find_by_zip(zip)
  when "quit"
    quit = true
  else

    puts "invalid method, Try again"
  end
  # puts "Please select what you would like to do"
end
