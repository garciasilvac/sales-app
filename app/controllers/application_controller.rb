class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	around_action :switch_locale
  		 
	def switch_locale(&action)
		puts "signed in switch locale? : " + user_signed_in?.to_s 
		locale = params[:locale] || I18n.default_locale
		I18n.with_locale(locale, &action)
	end

	def default_url_options
		puts "signed in default url opts? : " + user_signed_in?.to_s 
	  { locale: I18n.locale }
	end

	def after_sign_in_path_for(resource)
		sales_path	
	end
	
end
