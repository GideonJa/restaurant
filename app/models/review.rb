class Review < ActiveRecord::Base
  belongs_to  :restaurant
  belongs_to  :reviewer
 
    scope :search, lambda{|query| where(["score >= ?", "#{query}".to_i])}
  end
 