class User < ActiveRecord::Base
  has_many :appointments
  has_many :properties, through: :appointments

  def my_appointments
    self.appointments.each_with_index.map do |app, index|
    puts "#{index +1}. #{Property.find(app.property_id).address} at #{app.time} on #{app.date}" 

  end
  end


end
