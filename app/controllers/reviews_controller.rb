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
  end

  def create
      
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = "New review was added succesfully"
      redirect_to(:action => 'list', :restaurant_id => @review.restaurant_id)
    else
      render ("new")
    end
  end

  def list
     if @curr_restaurant
      then @reviews =Review.where(:restaurant_id => @curr_restaurant.id)
      else  @reviews =Review.all
     end
    end
    
    def listall
        @reviews =Review.order("id ASC")
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
  if @curr_restaurant
     then render ('list')
    else render ('listall')
    end
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
   if !@curr_restaurant
     then render ('edit_orphan')
   end
  end
  
  def edit_orphan
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
    if @curr_restaurant
       then 
        @reviews=Review.where(:restaurant_id => @curr_restaurant.id).search(params[:user_search])
        render ('list')
       else 
         @reviews=Review.search(params[:user_search])
           render ('listall')
    end
  end
end
private

def find_restaurant
   if params[:restaurant_id]
     @curr_restaurant = Restaurant.find_by_id(params[:restaurant_id])
   end
end
