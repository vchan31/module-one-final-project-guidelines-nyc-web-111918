class User < ActiveRecord::Base
  has_many :appointments
  has_many :properties, through: :appointments



  # def self.lowest_price
  #  Property.all.where(:avaliable == true ).order(:cost).first.human_output
  # end


end
