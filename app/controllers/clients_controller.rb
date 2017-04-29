class ClientsController < ApplicationController
	def index
		render json: Client.all, root: "data"
	end

	def list
		@client = Client.all
	end

	def show
		@client = Client.find(params[:id])
		render json: @client
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
		render json: @client
	end

	def get_by_cc
		@client = Client.get_by_cc(params[:cc])
		render json: @client
	end

	# def get_name_by_id
	# 	@client = Client.get_name_by_id(params[:id])
	# end
	#
	# def get_name_by_cc
	# 	@client = Client.get_name_by_cc(params[:cc])
	# end
	#
	# def get_lastName_by_id
	# 	@client = Client.get_lastName_by_id(params[:id])
	# end
	#
	# def get_lastName_by_cc
	# 	@client = Client.get_lastName_by_cc(params[:cc])
	# end
	#
	# def get_email_by_id
	# 	@client = Client.get_email_by_id(params[:id])
	# end
	#
	# def get_email_by_cc
	# 	@client = Client.get_email_by_cc(params[:cc])
	# end
	#
	# def get_phone_by_id
	# 	@client = Client.get_phone_by_id(params[:id])
	# end
	#
	# def get_phone_by_cc
	# 	@client = Client.get_phone_by_cc(params[:cc])
	# end
	#
	# def get_city_by_id
	# 	@client = Client.get_city_by_id(params[:id])
	# end
	#
	# def get_city_by_cc
	# 	@client = Client.get_city_by_cc(params[:cc])
	# end
	#
	# def get_address_by_id
	# 	@client = Client.get_address_by_id(params[:id])
	# end
	#
	# def get_address_by_cc
	# 	@client = Client.get_address_by_cc(params[:cc])
	# end
	#
	# def get_appointments_by_client_id
	# 	@client = Client.get_appointments_by_client_id(params[:q])
	# end
	#
	# def get_appointments_by_client_cc
	# 	@client = Client.get_appointments_by_client_cc(params[:cc])
	# end
	#
	# def get_bills_by_client_id
	# 	@client = Client.get_bills_by_client_id(params[:q])
	# end
	#
	# def get_appointments_by_client_cc
	# 	@client = Client.get_bills_by_client_cc(params[:cc])
	# end
end

	def get_clients_query
		if params[:sort].present?
			s = params[:sort].split(',')
			@client = Client.get_clients_query(params[:q],s)
		else
			@client = Client.get_clients_query(params[:q])
		end
		if params[:select].present?
			s = params[:select].split(',').map { |e| e.to_sym }
			i = []
			s.each do |e|
				if !Client.column_names.include?(e)
					i.push(e)
				end
			end
			render json: @client, fields: s, include: i
		else
			render json: @client
		end
	end

	def get_clients_by_name
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@client = Client.get_clients_by_name(params[:q],s)
		else
			@client = Client.get_clients_by_name(params[:q])
		end
		render json: @client
	end

	def get_clients_by_lastname
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@client = Client.get_clients_by_lastname(params[:q],s)
		else
			@client = Client.get_clients_by_lastname(params[:q])
		end
		render json: @client
	end

	def get_clients_by_cc
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@client = Client.get_clients_by_cc(params[:q],s)
		else
			@client = Client.get_clients_by_cc(params[:q])
		end
		render json: @client
	end

	def get_clients_by_email
		if params[:sort].present?
			s = params[:sort].split('-')
			p s
			@client = Client.get_clients_by_email(params[:q],s)
		else
			@client = Client.get_clients_by_email(params[:q])
		end
		render json: @client
	end
end
