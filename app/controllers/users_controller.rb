class UsersController < ApplicationController
  before_action :load_user, only: %i|show edit update destroy|

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User is created"
      redirect_to @user
    else
      flash.now[:danger] = "User isn't created"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @name = @user.name

    if @user.update_attributes user_params
      flash[:success] = "User is updated"
      redirect_to @user
    else
      flash.now[:danger] = "User isn't updated"
      render :edit
    end
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

  def user_params
    params.require(:user).permit :name
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = "User not found"
    redirect_to root_url
  end
end
