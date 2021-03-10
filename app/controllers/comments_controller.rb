class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to [@tweet]
    else
      render 'tweets/show'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to [:tweet, {id: params[:tweet_id]}]
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
