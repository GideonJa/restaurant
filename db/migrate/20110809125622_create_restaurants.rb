class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
       t.string  "rest_name",   :limit => 25
       t.string  "rest_city",   :limit => 50
       t.string  "cuisine",     :default => "American", :null => false
       t.integer "avg_rating",  :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
