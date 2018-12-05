class User < ActiveRecord::Base
  has_many :appointments
  has_many :properties, through: :appointments

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


end
