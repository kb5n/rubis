module Dashboard
  class SitesController < Dashboard::ApplicationController
    layout 'dashboard/application'

    # GET /dashboard/tags/1
    def show; end

    # GET /dashboard/tags/1/edit
    def edit; end

    # PATCH/PUT /dashboard/tags/1
    def update
      if @site.update(site_params)
        redirect_to dashboard_site_url, success: 'Site was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(:title, :description, :started_at, :copyright)
    end
  end
end
