class BrandsController < ApplicationController
  before_filter :require_authentication, :except => [:show]

  def show
    @brand = Brand.find(params[:id])
  end

	def new
		@brand = Brand.new
    render :layout => "window"
	end

	def create
		@brand = current_user.brands.build(params[:brand])

    if @brand.save
      redirect_to @brand, :notice => t("flash.brands.create.notice")
    else
      render :new, :layout => "window"
    end
	end
end