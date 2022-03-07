class VoteController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  def thumbs_up
    if params[:id].present? && current_user
      current_user.vote_up_for(article)
      redirect_to root_path
    end
  end

  def thumbs_down
    if params[:id].present? && current_user
      current_user.vote_down_for(article)
      redirect_to root_path
    end
  end

  def unvote
    if params[:id].present? && current_user
      current_user.unvote_for(article)
      redirect_to root_path
    end
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end
end
