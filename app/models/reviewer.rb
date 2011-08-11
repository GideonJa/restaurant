class Reviewer < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, :through => :reviews
   
  scope :search, lambda{|query| where(["rev_fname LIKE ? OR rev_lname LIKE ? OR rev_avg_rating <= ?", 
     "%#{query}%","%#{query}%","#{query}".to_i])}
end
