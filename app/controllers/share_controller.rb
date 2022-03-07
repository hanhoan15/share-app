class ShareController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def create
    @entries = Article.new(article_params)
    respond_to do |format|
      if @entries.save
        format.html  { redirect_to root_path }
      else
        format.html  { render :action => "new" }
      end
    end
  rescue ArgumentError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def article_params
    params.require(:article).permit(:url).merge({user_id: current_user.id})
  end
end
