class CreateZipcodes < ActiveRecord::Migration
  def self.up
    create_table :spree_zipcodes do |t|
      t.string :zipcode
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_zipcodes
  end
end
