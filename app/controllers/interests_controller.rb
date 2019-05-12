class InterestsController < ApplicationController

    before_action :http_authenticate
	
    def http_authenticate
        authenticate_or_request_with_http_basic do |username, password|
            username == 'admin' && password == Figaro.env.admin_pw
        end
    end
	
	def save_csv(my_csv)
		FileUtils.copy(my_csv.path, "#{Rails.root}/lib/interests.csv")
	end
	
	public
	
	def index
	end
	
	def upload
		flash[:notice] = "File successfully uploaded."
		my_csv = params["csv_file"]
		save_csv(my_csv)
		redirect_to interests_path
	end
	
end