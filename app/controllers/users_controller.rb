class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find(params[:id])
    @repos = Facebook.repos.list(user: @user.login) if @user.from_facebook?
  end
end
