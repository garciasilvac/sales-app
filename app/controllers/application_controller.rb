class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	around_action :switch_locale
  		 
	def switch_locale(&action)
		locale = params[:locale] || I18n.default_locale
		I18n.with_locale(locale, &action)
	end

	def default_url_options
	  { locale: I18n.locale }
	end

	def after_sign_in_path_for(resource)
		sales_path	
	end

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
		  format.json { head :forbidden, content_type: 'text/html' }
		  format.html { redirect_back fallback_location: '/', allow_other_host: false, alert: exception.message }
		  format.js   { head :forbidden, content_type: 'text/html' }
		end
	  end
	
end
