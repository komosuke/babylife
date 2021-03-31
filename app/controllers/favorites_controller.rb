class FavoritesController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]

  def index
    @tweets = Tweet.joins(:favorites).where(favorites: { user_id: params[:user_id]})
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
    @favorite.destroy
  end
end
