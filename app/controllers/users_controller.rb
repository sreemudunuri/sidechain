class UsersController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]
  before_action :find_user_by_id, only: %i[show edit destroy update follow]
  before_action :all_users, only: %i[index]

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(assign_params)
    if @user.save
      log_in_user(@user.id)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @session_id = session[:user_id]
    @following = @user.following
  end

  def edit

  end

  def update
    if @user.update(assign_params)
      redirect_to @user
    else
      render :user
    end
  end

  def destroy
    @user.destroy
    session.delete(:user_id)
    redirect_to users_path
  end

  def follow
    @session_id = session[:user_id]
    Follow.create(user_id: find_user_by_id.id, follower_id: session[:user_id])

    render :show


  end

  def unfollow
    @follow =  Follow.find_by(user_id: find_user_by_id.id, follower_id: session[:user_id])

    @follow.destroy

    render :show
  end

  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

  def all_users
    @users = User.all
  end

  def assign_params
    params.require(:user).permit(:name, :password)
  end

end
