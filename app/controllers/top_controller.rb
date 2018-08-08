class TopController < ApplicationController
  layout 'application'

  def index
    @articles = Article.where(user_id: @user.id).open.all.order('published_at desc')
  end
end
