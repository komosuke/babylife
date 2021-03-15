class MemoriesController < ApplicationController
  before_action :set_user

  def new
    @memory = current_user.memories.new
    @user = current_user
  end

  def create
    @memory = current_user.memories.new(memory_params)
    if @memory.save
      redirect_to user_path(@user.id)
    else
      render new
    end
  end

  def show
    @memory = current_user.memories.find(params[:id])
  end

  





  private

  def memory_params
    params.require(:memory).permit(:title, :content, :memory_date).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end