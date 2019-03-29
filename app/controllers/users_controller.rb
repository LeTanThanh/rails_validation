class UsersController < ApplicationController
  before_action :load_user, only: %i|show destroy|

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = "User is deleted"
    else
      flash[:danger] = "User isn't deleted"
    end

    redirect_to root_url
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = "User not found"
    redirect_to root_url
  end
end
