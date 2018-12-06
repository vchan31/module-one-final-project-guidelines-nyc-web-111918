require_relative '../config/environment'
def get_user_input
  gets.chomp.strip
end

def valid_zip?(zip)
  (Property.all_manhattan_zips).include?(zip)
end


def logo
  puts "         .-.                                              .-."
  puts "        (. .)__.')                                  (`.__(. .)"
  puts "        / V      )                                  (      V \\"
  puts "  ()    \\  (   \\/                                    \\/   )  /    ()"
  puts "<)-`\\()  `._`._ \\                                    / _.'_.'  ()/'-(>"
  puts "  <)_>=====<<==`'====================================`'==>>=====<_(>"
  puts " <>-'`(>                               Blue Jays Listings     <)'`-<>"
  puts ""
end

puts "#{" " * 44}~Blue Jays Listings~"

#press enter to quit out of current method
system("clear")
quit = nil
starts = nil
#Start program here
until starts == "Quit" || starts == "0"
  logo
  puts "Welcome to Blue Jays Listings"
  puts "Would would you like to do? \n
      [1] : User Login \n
      [2] : Make New User Account\n
      [3] : Public Search \n
      [0] : Quit\n"
  starts = get_user_input.split.map{|w| w.capitalize}.join(" ")
  system("clear")

  #can use case, but works about the same.
  if starts == "1" || starts == "User Login"
    puts "Please enter your first name"
    first_name = get_user_input.capitalize
    puts "Please enter your last name"
    last_name = get_user_input.capitalize
    user = User.find_by(first_name: first_name, last_name: last_name)
    if user.nil?
      system("clear")
      puts "Invalid name, please go make an account with us or browse the Public Search 😀\n"
      next
    end


    puts "Welcome back #{first_name.capitalize} #{last_name.capitalize}"
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
        puts "~Here are the listings for #{zip}~\n "
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
  elsif starts == "2" || starts == "Make New User Account"
    made = nil
    until made
      puts "Glad you decided to join us 😈"
      puts "Please enter your First Name, this will be apart of your login."
      new_first_name = get_user_input.capitalize
      puts "please enter your Last Name, this will be apart of your login as well."
      new_last_name = get_user_input.capitalize
      puts "What is your Budget?, press enter to leave blank"
      new_budget = get_user_input.to_i
      puts "What is your Credit Score?. hit return to leave blank"
      new_credit_score = get_user_input.to_i
      puts "What is your Income?, hit return to leave blank"
      new_income = get_user_input.to_i
      puts "What is your Phone number? please enter without special characters. \ne.g. 1112223333"
      new_phone_number = get_user_input
      #make check statment to match wiht DB by email so we cannot make an account with the same email address.
      puts "What is your email?"
      new_email = get_user_input

      system("clear")
      puts "First Name:   #{new_first_name} \nLast Name:    #{new_last_name} \nBudget:       #{new_budget} \nCredit Score: #{new_credit_score} \nIncome:       #{new_income} \nPhone Number: #{new_phone_number} \nEmail:        #{new_email}"

      puts "Is the above information correct? \nPlease enter Yes or No. \nIf you enter no, all the information will be lost"
      answer = get_user_input.downcase

      until answer == "yes" || answer == "no"
        puts "Thats invalid input, please try"
        answer = get_user_input.downcase
      end

      if answer == "yes"
        User.find_or_create_by({
          first_name: new_first_name,
          last_name: new_last_name,
          budget: new_budget,
          credit_score: new_credit_score,
          income: new_income,
          days_searching: 0,
          active: true,
          phone_number: new_phone_number,
          email: new_phone_number
          })
        system("clear")
        puts "Account successfully made made!?"
        puts "please try logining in with your first name and last name."
        break
      else
        system("clear")
        puts "information not saved, returning to home screen"
        break
      end
    end
  elsif starts == "3" || starts == "Public Search"
    leave = false
    until leave
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
        leave = true
        system("clear")
      else
        system("clear")
        puts "#{user_input} is not a valid input \nTry again"
      end
    end # end of public search
  elsif starts == "0" || starts == "Quit"
    break
  else#where there is an invalid input at Start menu
    system("clear")
    puts "##{starts} is not a valid input"
    puts "Invalid inputs, please try again.\n\n"

  end #end of what would you like to do loop
end #end of CLI program

logo
puts "Thanks for using our program! courtsey of Tony J. and Vincent J."
puts "#{" " * 44}~Blue Jays Listings~\n\n"
footer
