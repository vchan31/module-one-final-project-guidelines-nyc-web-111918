class Property < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments

  def human_output
    "Address: #{address}\nAsking Price: $#{cost}\nMonthly: #{monthly_cost}\nDays on Market: #{days_on_market}\nAmenities: #{amenities}\nDescription: #{description}\n#{"~." * 40}"
  end

end
