class ReviewsController < ApplicationController

    layout 'admin'
    before_filter :find_restaurant

  def index
    list
     render ('list')
  end

  def new
    @review = Review.new(:restaurant_id => @curr_restaurant.id)
    @restaurants = Restaurant.order('rest_name ASC')
    puts "============im after new review"
    puts  @review.inspect
  end

  def create
      
    @review = Review.new(params[:review])
    puts "============im before the save create"
    puts  @review.inspect
    puts "here are the PARAMS" + params[:review].inspect
    
    if @review.save
      flash[:notice] = "New review was added succesfully"
      redirect_to(:action => 'list', :restaurant_id => @review.restaurant_id)
    else
      render ("new")
    end
  end

  def list
    puts "============im in LIST before action"
        puts :restaurant_id.inspect
    puts  @curr_restaurant.id.inspect
    
      @reviews =Review.where(:restaurant_id => @curr_restaurant.id)
      puts "im in LIST"
      puts @reviews.inspect
      puts :restaurant_id.inspect
      puts  @curr_restaurant.id.inspect
  end

  def sort
      if session[:prev_sort_field].nil?  ||
          session[:prev_sort_field] != params[:sort_field]
      then
         session[:prev_sort_field] = params[:sort_field]
         session[:sort_dir] = 'ASC'
        else 
          switch_dir
      end

    @reviews =Review.order("#{params[:sort_field]} #{session[:sort_dir]}")
    render ('list')
  end

  def switch_dir
    if  session[:sort_dir] == 'ASC'
      then session[:sort_dir] = 'DESC'
      else session[:sort_dir] = 'ASC'
    end
  end
  def show
     @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
   @restaurants = Restaurant.order('rest_name ASC')
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
       flash[:notice] = "Review #{@review.id} was updates succesfully"
        redirect_to(:action => 'show', :id => @review.id, :restaurant_id => @review.restaurant_id)
      else
         redirect_to(:action => 'edit', :id => @review.id, :restaurant_id => @review.restaurant_id)
      end
  end

  def delete
     @review = Review.find(params[:id])
      @restaurants = Restaurant.order('rest_name ASC')
  end
  def destroy
    @review = Review.find(params[:id])
    if params[:commit] == "Delete Review"
      then
       Review.find(params[:id]).destroy
       flash[:notice] = "Review deleted successfully"
     end
      redirect_to(:action => 'list', :restaurant_id => @review.restaurant_id)
  end
  def search
  @reviews=Review.where(:restaurant_id => @curr_restaurant.id).search(params[:user_search])
  render ('list')

  end
end
private

def find_restaurant
   if params[:restaurant_id]
     @curr_restaurant = Restaurant.find_by_id(params[:restaurant_id])
   end
end
