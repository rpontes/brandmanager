class BrandsController < ApplicationController

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(params[:brand])
	end
end