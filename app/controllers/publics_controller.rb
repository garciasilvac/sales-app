class PublicsController < ApplicationController
	skip_before_action :authenticate_user!
    def home
	end
	
	def login
    	if user_signed_in?
    		redirect_to sales_path
    	else
    		@user=User.new
    	end
    end
end