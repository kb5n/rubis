class TopController < ApplicationController
  layout 'application'
  def index
    @site_name = 'Welcome!!'
  end
end
