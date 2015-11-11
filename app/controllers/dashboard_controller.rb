class DashboardController < ApplicationController
  def index
    render :landing
  end
end


    # if current_user
    #   @talents = current_user
    #                .suitable_talents
    #                .order(created_at: :desc)
    #                .page(params[:page])
    #   render 'talents/index'
    # else
    #   render :landing
    # end
