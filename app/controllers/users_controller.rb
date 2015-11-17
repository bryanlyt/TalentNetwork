class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  	@users = User.all
  	if params[:search]
    	@users = User.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 30)
    else  	
    	@users = User.all.order('created_at DESC').paginate(page: params[:page], per_page: 30)  	
    end
  end



end
