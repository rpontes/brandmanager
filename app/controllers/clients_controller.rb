class ClientsController < ApplicationController

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(params[:client])
	end
end