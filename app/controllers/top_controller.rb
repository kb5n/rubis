class TopController < ApplicationController
  layout 'application'

  def index
    @articles = Article.open.all.order('published_at desc')
  end
end
