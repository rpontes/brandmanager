class BrandsController < ApplicationController
  before_filter :require_authentication, :except => [:show, :index]
  before_filter :find_clients, :except => [:show, :index]

  def show
    @brand = Brand.find(params[:id])
  end

	def new
		@brand = Brand.new
    render :layout => "window"
	end

  def index
    @brands = BrandFilter.filter(params)
  end

	def create
		@brand = current_user.brands.build(params[:brand])

    if @brand.save
      redirect_to @brand, :notice => t("flash.brands.create.notice")
    else
      render :new, :layout => "window"
    end
	end

  private
  def find_clients
    @clients = Client.sorted_by_name
  end
end