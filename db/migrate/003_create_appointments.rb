class CreateAppointments < ActiveRecord::Migration[5.0]

def change
	create_table :appointments do |t|
		t.integer :user_id
		t.integer :property_id
		t.string :time
		t.string :date

	end
end


end