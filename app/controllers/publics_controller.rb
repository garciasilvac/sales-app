class PublicsController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:home]
	def home
		if user_signed_in?
			puts "signed in home"
			redirect_to sales_path
		end
	end
end