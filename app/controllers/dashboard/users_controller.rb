module Dashboard
  class UsersController < Dashboard::ApplicationController
    before_action :set_user, only: %i[show edit update]

    layout 'dashboard/application'

    # GET /dashboard/users/1
    def show; end

    # GET /dashboard/users/1/edit
    def edit; end

    # PATCH/PUT /dashboard/users/1
    def update
      if @user.update(user_params)
        redirect_to [:dashboard, @user], success: 'User was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:identifier, :email, :name, :password, :password_confirmation, :blog_title, :blog_description, :blog_started_at)
    end
  end
end
