class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created successfully"
    else
      render :new
    end
  end

  # protected actions: show/edit/update/destroy
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated"
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Account deleted"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

