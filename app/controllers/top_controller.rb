class TopController < ActionController::Base
  layout 'top'

  def index
    @users = User.all
  end
end
