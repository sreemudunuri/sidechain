class UsersController < ApplicationController

  before_action :find_user_by_id, only: %i[create show edit destroy]
  before_action :all_users, only: %i[index ]

  def index

  end

  def new
    @user = User.new

    redirect_to @user
  end

  def create
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
  end

  def destroy
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
