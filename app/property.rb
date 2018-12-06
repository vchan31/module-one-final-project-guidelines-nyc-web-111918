class Property < ActiveRecord::Base
  has_many :appointments
  has_many :saves
  has_many :users, through: :appointments
  has_many :users, through: :saves

  def human_output
    "Address: #{address}\nAsking Price: $#{cost}   Monthly: #{monthly_cost}   Days on Market: #{days_on_market}\nAmenities: #{amenities}\nDescription: #{description}\n#{"~." * 60}"
  end

  def self.lowest_price
   self.all.where(:avaliable == true ).order(:cost).first.human_output
  end

  def self.highest_price
   self.all.where(:avaliable == true ).order(:cost).last.human_output
  end

  def self.all_manhattan_zips
    [10026, 10027, 10030, 10037, 10039, 10001, 10011, 10018, 10019,
    10020, 10036, 10029, 10035, 10010, 10016, 10017, 10022, 10012,
    10013, 10014, 10004, 10005, 10006, 10007, 10038, 10280, 10002,
    10003, 10009, 10021, 10028, 10044, 10065, 10075, 10128, 10023,
    10024, 10025,10031, 10032, 10033, 10034, 10040, 11111]
    #11111 is a testing zipcodes
  end

  def self.find_by_zip(zipcode)
    all_found = self.all.where(zip: zipcode, availibity: true)
    all_found.map do |pr|

      pr.human_output
    end
  end

  def self.new_listing
   first_three = self.all.where(:avaliable == true ).order(:days_on_market).limit(3)
   first_three.map {|pr| pr.human_output}
  end


end
