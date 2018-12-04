class User < ActiveRecord::Base
  has_many :appointments
  has_many :properties, through: :appointments

  def self.find_by_zip(zipcode)
    #only works with single objects
    #needs to iterate if not single
    all_found = Property.all.where(zip: zipcode)
    all_found.map {|pr| pr.human_output}
  end


end
