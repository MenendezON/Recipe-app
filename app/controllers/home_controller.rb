class HomeController < ApplicationController
  def index
    @current_user_name = current_user.name[0, 1]
  end
end
