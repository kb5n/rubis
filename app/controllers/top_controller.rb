class TopController < ApplicationController
  layout 'application'

  def index
    @articles = Article.published.where('published_at <= ?', Time.current).all.order('published_at desc')
  end
end
