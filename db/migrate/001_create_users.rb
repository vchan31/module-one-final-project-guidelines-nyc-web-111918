class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :budget
      t.integer :credit_score
      t.integer :income
      t.integer :days_searching
      t.boolean :active
      t.string :phone_number
      t.string :email
    end
  end
end
