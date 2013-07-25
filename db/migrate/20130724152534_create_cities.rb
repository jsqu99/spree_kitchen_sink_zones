class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :spree_cities do |t|
      t.string :name
      t.integer :state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :spree_cities
  end
end
