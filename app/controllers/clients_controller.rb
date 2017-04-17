class ClientsController < ApplicationController
	def index
		render json: Client.all, root: "data"
	end

	def list
		@admin = Client.all
	end

	def show
		@client = Client.find(params[:id])
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(params[:client])
		if @client.save
			redirect_to @client
		else
			render "new"
		end
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		@client.update(cc: params[:cc], name: params[:name], lastName: params[:lastName], email: params[:email], password_digest: params[:password_digest], phone: params[:phone])

	end

	def delete
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to action: "list"

	end

	def get_clients
		@client = Client.get_clients(params[:page],params[:per_page])
	end

	def get_by_id
		@client = Client.get_by_id(params[:id])
	end

	def get_by_cc
		@client = Client.get_by_cc(params[:cc])
	end

	def get_name_by_id
		@client = Client.get_name_by_id(params[:id])
	end

	def get_name_by_cc
		@client = Client.get_name_by_cc(params[:cc])
	end

	def get_lastName_by_id
		@client = Client.get_lastName_by_id(params[:id])
	end

	def get_lastName_by_cc
		@client = Client.get_lastName_by_cc(params[:cc])
	end

	def get_email_by_id
		@client = Client.get_email_by_id(params[:id])
	end

	def get_email_by_cc
		@client = Client.get_email_by_cc(params[:cc])
	end

	def get_phone_by_id
		@client = Client.get_phone_by_id(params[:id])
	end

	def get_phone_by_cc
		@client = Client.get_phone_by_cc(params[:cc])
	end

	def get_city_by_id
		@client = Client.get_city_by_id(params[:id])
	end

	def get_city_by_cc
		@client = Client.get_city_by_cc(params[:cc])
	end

	def get_address_by_id
		@client = Client.get_address_by_id(params[:id])
	end

	def get_address_by_cc
		@client = Client.get_address_by_cc(params[:cc])
	end

	def get_appointments_by_client_id
		@client = Client.get_appointments_by_client_id(params[:q])
	end

	def get_appointments_by_client_cc
		@client = Client.get_appointments_by_client_cc(params[:cc])
	end

	def get_bills_by_client_id
		@client = Client.get_bills_by_client_id(params[:q])
	end

	def get_appointments_by_client_cc
		@client = Client.get_bills_by_client_cc(params[:cc])
	end
end





















