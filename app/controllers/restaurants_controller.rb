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
      @restaurants =Restaurant.order("#{params[:sort_field]} #{session[:sort_dir]}") 
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

end
