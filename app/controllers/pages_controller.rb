class PagesController < ApplicationController
  def home
    @user_count = User.count
  end
end