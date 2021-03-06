class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Design in Progress, #{@user.username}"
      redirect_to feed_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = "Your details have been updated, #{@user.username}"
      redirect_to feed_path
    else
      render 'new'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:success] = "User was successfully destroyed."
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :username, :email, :password, :year, :major)
  end
end
