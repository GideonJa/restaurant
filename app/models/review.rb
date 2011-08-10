class Review < ActiveRecord::Base
 
    scope :search, lambda{|query| where(["score >= ?", "#{query}".to_i])}
  end
 