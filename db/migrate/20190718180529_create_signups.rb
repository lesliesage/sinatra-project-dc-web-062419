class CreateSignups < ActiveRecord::Migration[5.2]
  def change
    create_table :signups do |t|
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
end
