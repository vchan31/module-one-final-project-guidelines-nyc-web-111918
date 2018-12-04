class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :type_of_property
      t.integer :zip 
      t.integer :cost
      t.integer :monthly_cost
      t.integer :year_built
      t.boolean :availibity
      t.string :amenities
      t.float :proximity_to_subway
      t.integer :sqft
      t.integer :days_on_market
      t.string :description

    end
  end
end
