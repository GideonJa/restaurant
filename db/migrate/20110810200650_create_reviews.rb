class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
        t.references :reviewer
        t.references :restaurant
        t.integer     :score
        t.string      "rev_summary"
        t.timestamps
      t.timestamps
    end
     add_index :reviews, ['reviewer_id', 'restaurant_id']
  end

  def self.down
    drop_table :reviews
  end
end
