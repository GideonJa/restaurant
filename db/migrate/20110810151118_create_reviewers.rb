class CreateReviewers < ActiveRecord::Migration
  def self.up
    create_table :reviewers do |t|
       t.string  "rev_fname",           :limit => 25
       t.string  "rev_lname",           :limit => 25
       t.integer "rev_avg_rating",      :default => 0
       t.integer "rev_num_of_rating",   :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :reviewers
  end
end
