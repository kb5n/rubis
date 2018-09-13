class CategoriesController < ApplicationController
  layout 'application'

  def show
    @category = Category.find_by!(identifier: params[:identifier])
    @articles = Article.opened.where(category_id: @category.id).order('published_at desc')
    render 'user/index'
  end
end
