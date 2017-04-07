class ClientsController < ApplicationController

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
end
