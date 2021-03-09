class TweetsController < ApplicationController
  before_action :move_to_index, only: [:destroy]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :genre, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if @tweet.user != current_user
  end
end
