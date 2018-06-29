class ArticlesController < ApplicationController
  layout 'application'

  # GET /articles/identifier
  def show
    @article = Article.find_by!(identifier: params[:identifier], status: :published)
  end
end
