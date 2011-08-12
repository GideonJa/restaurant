class Reviewer < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, :through => :reviews
   
  scope :search, 
        lambda{|query| 
        if query.to_i == 0
            then  where(["rev_fname LIKE ? OR rev_lname LIKE ? ", "%#{query}%","%#{query}%"])
            else  where("rev_avg_rating <=  #{query}")
        end
        }
   
end
