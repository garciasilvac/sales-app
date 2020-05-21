class PublicsController < ApplicationController
	skip_before_action :authenticate_user!
    def home
    	@user=User.new
    end
end