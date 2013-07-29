class CreateZipcodes < ActiveRecord::Migration
  def self.up
    create_table :spree_zipcodes do |t|
      t.string :zipcode
      t.string :city
      t.integer :state_id
      t.string :state_abbr # a performance enhancement for json lookups

      t.timestamps
    end

    add_index :spree_zipcodes, :zipcode
  end

  def self.down
    drop_table :spree_zipcodes
  end
end
