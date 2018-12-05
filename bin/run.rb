require_relative '../config/environment'

def get_user_input
  gets.chomp.strip
end

def valid_zip?(zip)
  (Property.all_manhattan_zips).include?(zip)
end
#press enter to quit out of current method
system("clear")
quit = nil
#Start program here
puts "Welcome to Blue Jays Listings"
puts "Would you like to \n
    [1] : User Login \n
    [2] : Public Search \n
    [0] : Quit\n"
starts = get_user_input
system("clear")
if starts == "User Login" || starts == "1"
  puts "Please enter your first name, it is case sensitive."
  first_name = get_user_input
  puts "Please enter your last name, it is case sensitive"
  last_name = get_user_input
  user = User.find_by(first_name: first_name, last_name: last_name)

  puts "Welcome #{first_name} #{last_name}"
  until quit
    puts "\n#{"~." * 40}\nPlease select what you would like to do. \nnote: all searches apply to Manhattan properties only\nPlease key-in one of the following of options by number"

    puts "
    [1] : highest priced listing \n
    [2] : lowest priced listing \n
    [3] : search by zip \n
    [4] : newest listing\n
    [5] : most popular\n
    [6] : my appointments\n
    [7] : my info\n
    [0] : quit\n#{"~." * 40}"
    user_input = get_user_input

    case user_input
    when "1", "highest priced listing"
      system("clear")
      puts Property.highest_price
    when "2", "lowested priced listing"
      system("clear")
      puts Property.lowest_price
    when "3", "search by zip"
      system("clear")
      puts "please enter a zip code"
      zip = get_user_input.to_i
      until valid_zip?(zip)
        puts "#{zip} is not a valid input\nplease put in a valid Manhattan zip.\ne.g. 10011"
        zip = get_user_input.to_i
      end
      system("clear")
      puts "Here are the listings for #{zip}\n"
      puts Property.find_by_zip(zip)
    when "4", "newest listing"
      system("clear")
      puts Property.new_listing
    when "5" , "most popular"
      system("clear")
      puts Appointment.most_popular
    when "6", "my appointments"
      system("clear")
      puts user.my_appointments
    when "7", "my info"
      system("clear")
      puts user.my_profile
    when "0", "quit", "exit"
      quit = true
      system("clear")
    else
      system("clear")
      puts "#{user_input} is not a valid input \nTry again"
    end

  end # end of user search

elsif starts == "Public Search" || starts == "2"
  until quit

    puts "\n#{"~." * 40}\nPlease select what you would like to do. \nnote: all searches apply to Manhattan properties only\nPlease key-in one of the following of options by number"

    puts "
    [1] : highest priced listing \n
    [2] : lowest priced listing \n
    [3] : search by zip \n
    [4] : newest listing\n
    [5] : most popular\n
    [0] : quit\n#{"~." * 40}"
    user_input = get_user_input

    case user_input
    when "1", "highest priced listing"
      system("clear")
      puts Property.highest_price
    when "2", "lowested priced listing"
      system("clear")
      puts Property.lowest_price
    when "3", "search by zip"
      system("clear")
      puts "please enter a zip code"
      zip = get_user_input.to_i
      until valid_zip?(zip)
        puts "#{zip} is not a valid input\nplease put in a valid Manhattan zip.\ne.g. 10011"
        zip = get_user_input.to_i
      end
      system("clear")
      puts "Here are the listings for #{zip}\n"
      puts Property.find_by_zip(zip)
    when "4", "newest listing"
      system("clear")
      puts Property.new_listing
    when "5" , "most popular"
      system("clear")
      puts Appointment.most_popular
    when "0", "quit", "exit"
      quit = true
      system("clear")
    else
      system("clear")
      puts "#{user_input} is not a valid input \nTry again"
    end

  end # end of public search
elsif starts == "Quit" || starts == "0"

else
  puts "Invalid inputs"
end #end of CLI program

puts "Thanks for using our program! courtsey of Tony J. and Vincent J."
