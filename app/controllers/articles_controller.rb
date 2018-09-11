class ArticlesController < ApplicationController
  layout 'application'

  # GET /articles/identifier
  def show
    @article = Article.opened.find_by!(identifier: params[:identifier])
  end
end
