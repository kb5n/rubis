class TagsController < ApplicationController
  layout 'application'

  def show
    @tag = Tag.find_by!(identifier: params[:identifier])
    @articles = Article.opened.where(tags: { id: @tag.id }).joins(:tags).order('published_at desc')
    render 'user/index'
  end
end
