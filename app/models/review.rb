class Review < ActiveRecord::Base
  belongs_to  :restaurant
  belongs_to  :reviewer
 
    scope :search, lambda{|query| 
    if query.to_i == 0
        then    where(["rev_summary LIKE ? ", "%#{query}%"])
        else   where("score <=  #{query}")
    end
  }
end