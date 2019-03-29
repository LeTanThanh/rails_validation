class UsersController < ApplicationController
  before_action :load_user, only: %i|show|

  def index
    @users = User.all
  end

  def show
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = "User not found"
    redirect_to root_url
  end
end
