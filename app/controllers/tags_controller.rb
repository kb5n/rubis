class TagsController < ApplicationController
  layout 'application'

  def show
    @tag = Tag.find_by!(identifier: params[:identifier])
    @articles = Article.where(tags: { id: @tag.id })
                       .published
                       .where('published_at <= ?', Time.current)
                       .joins(:tags)
                       .all
                       .order('published_at desc')
    render 'top/index'
  end
end
