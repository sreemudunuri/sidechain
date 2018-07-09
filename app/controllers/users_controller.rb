class UsersController < ApplicationController

  before_action :find_user_by_id, only: %i[show edit destroy]
  before_action :all_users, only: %i[index]

  def index

  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(assign_params)
    if @user.save
      redirect_to @user
    else
      render @user
    end
  end

  def show

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

    redirect_to users_path
  end

  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

  def all_users
    @users = User.all
  end

  def assign_params
    params.require(:user).permit(:name)
  end

end
