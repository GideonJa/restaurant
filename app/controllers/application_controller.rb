class ApplicationController < ActionController::Base
  protect_from_forgery


   def initialize_sort
    params.merge!( :sort_field => 'rest_name', :sort_dir => 'ASC' )
   end
end
