class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :genre, :image).merge(user_id: current_user.id)
  end

end
