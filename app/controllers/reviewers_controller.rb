class ReviewersController < ApplicationController
      layout 'admin'
      before_filter :initialize_sort

    def index
      list
       render ('list')
    end

    def new
      @restaurat = Reviewer.new
    end

    def create
      @reviewer = Reviewer.new(params[:reviewer])
      if @reviewer.save
        flash[:notice] = "New reviewer was added succesfully"
        redirect_to(:action => 'list')
      else
        render ("new")
      end
    end

    def list
        @reviewers =Reviewer.order("rev_fname ASC") 
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
      @reviewers =Reviewer.order("#{params[:sort_field]} #{session[:sort_dir]}")
      render ('list')
    end

    def switch_dir
      if  session[:sort_dir] == 'ASC'
        then session[:sort_dir] = 'DESC'
        else session[:sort_dir] = 'ASC'
      end
    end
    
    def show
       @reviewer = Reviewer.find(params[:id])
    end

    def edit
      @reviewer = Reviewer.find(params[:id])
    end

    def update
      @reviewer = Reviewer.find(params[:id])
      if @reviewer.update_attributes(params[:reviewer])
         flash[:notice] = "Reviewer #{@reviewer.id} was updates succesfully"
          redirect_to(:action => 'show', :id => @reviewer.id)
        else
           redirect_to(:action => 'edit', :id => @reviewer.id)
      end
    end

    def delete
       @reviewer = Reviewer.find(params[:id])
    end
    
    def destroy
      if params[:commit] == "Delete Reviewer"
        then
         Reviewer.find(params[:id]).destroy
         flash[:notice] = "Reviewer deleted successfully"
      end
        redirect_to(:action => 'list')
    end
    
    def search
    @reviewers=Reviewer.search(params[:user_search])
    render ('list')
    end
  end

