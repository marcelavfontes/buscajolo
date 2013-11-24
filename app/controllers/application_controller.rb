class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :authorize

	delegate :allow?, to: :current_permission
	helper_method :allow?

	private

	def current_permission
	  @current_permission ||= Permission.new(current_user)
	end

	def authorize
	  if !current_permission.allow?(params[:controller], params[:action])
	    redirect_to root_url, alert: "Opa!"
	  end
	end

end
