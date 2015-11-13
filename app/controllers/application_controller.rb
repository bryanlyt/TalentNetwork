class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :error, :success

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, error: exception.message
  end

	rescue_from ActiveRecord::RecordNotFound do
  	flash[:warning] = 'Resource not found.'
  	redirect_back_or root_path
	end

	def redirect_back_or(path)
	  redirect_to request.referer || path
	end

end
