class ReviewsController < ApplicationController

    layout 'admin'
    before_filter :initialize_sort

  def index
    list
     render ('list')
  end

  def new
    @restaurat = Review.new
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = "New review was added succesfully"
      redirect_to(:action => 'list')
    else
      render ("new")
    end
  end

  def list
      @reviews =Review.all
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
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
       flash[:notice] = "Review #{@review.id} was updates succesfully"
        redirect_to(:action => 'show', :id => @review.id)
      else
         redirect_to(:action => 'edit', :id => @review.id)
      end
  end

  def delete
     @review = Review.find(params[:id])
  end
  def destroy
    if params[:commit] == "Delete Review"
      then
       Review.find(params[:id]).destroy
       flash[:notice] = "Review deleted successfully"
     end
      redirect_to(:action => 'list')
  end
  def search
  @reviews=Review.search(params[:user_search])
  render ('list')

  end
end
