class UserController < ApplicationController
  layout 'application'

  def index
    @articles = Article.where(user_id: @user.id).opened.order('published_at desc')
  end
end
