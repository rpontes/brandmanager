class UsersController < ApplicationController
	layout "window"

  def show
    @user = User.find_by_email!(params[:id])
    render :layout => "application"
  end    

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
      Signup.process(@user)

			redirect_to login_path,
        :notice => t("flash.users.create.notice")
    else
      render :new
    end
	end
end