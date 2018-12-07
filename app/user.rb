class User < ActiveRecord::Base
  has_many :appointments
  has_many :saves
  has_many :properties, through: :appointments
  has_many :properties, through: :saves

  def my_appointments
    self.appointments.each_with_index.map do |app, index|
    puts "#{index +1}. #{Property.find(app.property_id).address} at #{app.time} on #{app.date}"
    end
  end

  def my_profile
    "  My Profile\n\n  Name:#{first_name} #{last_name}\n  Email: #{email}\n  Number:#{phone_number}\n  Days Searching #{days_searching}\n  Income: $#{income}\n  Budget: $#{budget}\n  Credit Score #{credit_score}"
  end

  def edit_my_profile
  end
#make method work here!
  # def self.make_new_account
  #     puts "Glad you decided to join us 😈"
  #     puts "Please enter your First Name, this will be apart of your login."
  #     new_first_name = get_user_input.capitalize
  #     puts "please enter your Last Name, this will be apart of your login as well."
  #     new_last_name = get_user_input.capitalize
  #     puts "What is your Budget?, press enter to leave blank"
  #     new_budget = get_user_input.to_i
  #     puts "What is your Credit Score?. hit return to leave blank"
  #     new_credit_score = get_user_input.to_i
  #     puts "What is your Income?, hit return to leave blank"
  #     new_income = get_user_input.to_i
  #     puts "What is your Phone number? please enter without special characters. \ne.g. 1112223333"
  #     new_phone_number = get_user_input
  #     #make check statment to match wiht DB by email so we cannot make an account with the same email address.
  #     puts "What is your email?"
  #     new_email = get_user_input
  #
  #     system("clear")
  #     puts "First Name:   #{new_first_name} \nLast Name:    #{new_last_name} \nBudget:       #{new_budget} \nCredit Score: #{new_credit_score} \nIncome:       #{new_income} \nPhone Number: #{new_phone_number} \nEmail:        #{new_email}"
  #
  #     puts "Is the above information correct? \nPlease enter Yes or No. \nIf you enter no, all the information will be lost"
  #     answer = get_user_input.downcase
  #
  #     until answer == "yes" || answer == "no"
  #       puts "Thats invalid input, please try"
  #       answer = get_user_input.downcase
  #     end
  #
  #     if answer == "yes"
  #       User.find_or_create_by({first_name: new_first_name, last_name: new_last_name, budget: new_budget, credit_score: new_credit_score, income: new_income, days_searching: 0, active: true, phone_number: new_phone_number, email: new_phone_number})
  #       system("clear")
  #       puts "Account successfully made made!?"
  #       puts "please try logining in with your first name and last name."
  #       # break
  #     else
  #       system("clear")
  #       puts "information not saved, returning to home screen"
  #       # break
  #     end
  # end

def save_property(address)
  property = Property.find_by(address: address)

  Save.find_or_create_by(user_id: self.id, property_id: property.id)

puts "Your Property has been saved!"
end

#user.save
def all_my_saves
  puts "Here are your saved items:"
  saved_properties = Save.all.where(user_id: self.id)
  saved_properties.each_with_index.map do |app,index|
    puts "#{index+1}. Address: #{Property.find(app.property_id).address}"
  end
end


def remove_property(address)
  property = Property.find_by(address: address)
  Save.find_by(user_id: self.id, property_id: property.id).destroy
end

end #end User class
