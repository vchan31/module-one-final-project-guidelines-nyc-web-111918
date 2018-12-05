class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  def self.most_popular
    Property.find(Appointment.group(:property_id).count.sort_by {|k,v| v}.last.first).human_output
  end

end
