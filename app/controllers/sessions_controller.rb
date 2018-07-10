class SessionsController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]

  def new

  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
    log_in_user(@user.id)

      redirect_to @user
    else
      @error = "Those credentials don't match anything we have in the database"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:session).permit(:name, :password)

  end
end
