class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @memories = Memory.where(user_id: @user.id)
    @memory = Memory.new
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :profile)
  end
end
