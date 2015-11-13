class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  	# @users = User.all
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)  	

  end

  def show
    @user = User.find(params[:id])

  end
end
