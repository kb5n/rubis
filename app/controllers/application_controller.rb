class ApplicationController < ActionController::Base
  prepend_before_action :load_site

  private

  def load_site
    @site = Site.find(1)
    @tags = Tag.all
    @categories = Category.all
  end
end
