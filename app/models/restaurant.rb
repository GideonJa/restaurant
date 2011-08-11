class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, :through => :reviews
  
  
   scope :search, lambda{|query| where(["rest_name LIKE ? OR rest_city LIKE ? OR cuisine LIKE ? OR avg_rating <= ?", 
     "%#{query}%","%#{query}%","%#{query}%","#{query}".to_i])}
end
