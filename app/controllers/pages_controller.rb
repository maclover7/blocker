class PagesController < ApplicationController
  before_filter :authenticate, only: [:admin]

  def home
    @user_count = User.count
  end

  def admin
    @user_count = User.count
    @users = User.all
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV['username'] && password == ENV['password']
    end
  end
end