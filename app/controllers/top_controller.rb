class TopController < ApplicationController
  layout 'application'
  def index
    @site_name = 'Homepage'
  end
end
