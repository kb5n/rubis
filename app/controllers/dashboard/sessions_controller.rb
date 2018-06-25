module Dashboard
  class SessionsController < Dashboard::ApplicationController
    skip_before_action :require_login, except: [:destroy]

    layout 'dashboard/login'

    def new
      @user = User.new
    end

    def create
      @user = login(params[:user][:email], params[:user][:password])
      if @user
        redirect_to dashboard_root_path, info: 'welcome'
      else
        redirect_to dashboard_login_path, error: 'certification failed.'
      end
    end

    def destroy
      logout
      redirect_to dashboard_root_path, info: 'good-bye!'
    end
  end
end
