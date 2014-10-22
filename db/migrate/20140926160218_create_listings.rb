class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :address
      t.string :city
      t.string :state
      t.date :lease_start
      t.string :lease_length
      t.string :lease_type
      t.integer :rooms
      t.text :description
      t.string :email
      t.string :phone
      t.integer :rent
      t.integer :zipcode

      t.timestamps
    end
  end
end
