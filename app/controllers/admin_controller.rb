class AdminController < ApplicationController
  before_filter :require_authentication

  private
  def require_authentication
    authenticate_or_request_with_http_basic "Brandmanager:Admin" do |email, password|
      user = Authenticator.authenticate(email, password)
      user && user.admin?
    end
  end
end
