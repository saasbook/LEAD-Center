require 'csv'

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
		my_csv = params["csv_file"]
		
		if (my_csv.nil?)
			flash[:notice] = "Please upload a file."
			redirect_to interests_path
			return
		end
		
		# Simple validation
		csv_text = File.read(my_csv.path)
		parsed = CSV.parse(csv_text)
		if (parsed[0][0] != 'Organization ID' or parsed[0][1] != 'Organization Interest')
			flash[:notice] = "Please have the correct headers."
			redirect_to interests_path
			return
		end
		
		save_csv(my_csv)
		flash[:notice] = "File successfully uploaded."
		redirect_to interests_path
	end
	
end