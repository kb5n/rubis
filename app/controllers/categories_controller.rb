class CategoriesController < ApplicationController
  layout 'application'

  def show
    @category = Category.find_by!(identifier: params[:identifier])
    @articles = Article.where(category_id: @category.id).published.where('published_at <= ?', Time.current).all.order('published_at desc')
    render 'top/index'
  end
end
