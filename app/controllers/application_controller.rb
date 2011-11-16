require "application_responder"

class ApplicationController < ActionController::Base

  before_filter :apply_role

	def apply_role
		if user_signed_in?
			if current_user.roles.length == 0
				current_user.roles << :author
			end
		end
	end
 
 
  self.responder = ApplicationResponder
  respond_to :html, :atom, :js

  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
 
end
