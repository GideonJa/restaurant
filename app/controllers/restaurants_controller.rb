class RestaurantsController < ApplicationController
    layout 'admin'
    before_filter :initialize_sort
    
  def index
    list
     render ('list')
  end
  
  def new
    @restaurat = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      flash[:notice] = "New restaurant was added succesfully"
      redirect_to(:action => 'list')
    else
      render ("new")
    end
  end

  def list
    
        puts "THIS IS GREAT LIST-------#{session[:prev_sort_field]}-----" 
        puts "THIS IS GREAT im NIL-------#{session[:prev_sort_field]}-----" if session[:prev_sort_field].nil?
         puts "THIS IS GREAT im empty-------#{session[:prev_sort_field]}-----" if session[:prev_sort_field] ==""
      @restaurants =Restaurant.order("rest_name ASC") 
  end
  
  def sort
        puts "THIS IS GREAT sort -------#{session[:prev_sort_field]}-----" 
      if session[:prev_sort_field].nil?  ||
          session[:prev_sort_field] != params[:sort_field]
      then
         session[:prev_sort_field] = params[:sort_field]
         session[:sort_dir] = 'ASC'
        else 
          switch_dir
      end
  
    @restaurants =Restaurant.order("#{params[:sort_field]} #{session[:sort_dir]}")
    render ('list')
  end
  
  def switch_dir
    if  session[:sort_dir] == 'ASC'
      then session[:sort_dir] = 'DESC'
      else session[:sort_dir] = 'ASC'
    end
  end
  def show
     @restaurant = Restaurant.find(params[:id])
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(params[:restaurant])
       flash[:notice] = "Restaurant #{@restaurant.id} was updates succesfully"
        redirect_to(:action => 'show', :id => @restaurant.id)
      else
         redirect_to(:action => 'edit', :id => @restaurant.id)
      end
  end

  def delete
     @restaurant = Restaurant.find(params[:id])
  end
  def destroy
    if params[:commit] == "Delete Restaurant"
      then
       Restaurant.find(params[:id]).destroy
       flash[:notice] = "Restaurant deleted successfully"
     end
      redirect_to(:action => 'list')
  end
  def search
  @restaurants=Restaurant.where(:rest_name => params[:user_search])
  render ('list')
  
  end

end
