class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.find_or_create_by(name: params["name"])
    session[:user_id] = @user.id
    redirect_back fallback_location: "/"

  end

  def show
  end

  def delete
  end
end
