class ChangeZipcodeFormatInListings < ActiveRecord::Migration
  def change
    change_column :listings, :zipcode, :string
  end
end
