class HomeController < ApplicationController
  def index
    @current_user = current_user
    @articles = ActiveModel::ArraySerializer.new(
      Article.all.order(created_at: :desc),
      each_serializer: Articles::ArticleSerializer,
      scope: { current_user: current_user },
      root: false).
      as_json
  end
end
