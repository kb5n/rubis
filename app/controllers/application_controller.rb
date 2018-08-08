class ApplicationController < ActionController::Base
  prepend_before_action :load_options

  private

  def load_options
    @user = User.where(identifier: params[:user_identifier]).first!
    @tags = Tag.where(user_id: @user.id).all
    @categories = Category.where(user_id: @user.id).all
  end
end
