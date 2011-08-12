class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, :through => :reviews
  
  
   scope :search, 
        lambda{|query| 
          if query.to_i ==0 
            then where(["rest_name LIKE ? OR rest_city LIKE ? OR cuisine LIKE ?", 
                          "%#{query}%","%#{query}%","%#{query}%"])
          else where("avg_rating <=  #{query}")
          end
        }
end
