module Dashboard
  class TagsController < Dashboard::ApplicationController
    before_action :set_tag, only: %i[edit update destroy]

    layout 'dashboard/application'
    # GET /dashboard/tags
    def index
      @tags = Tag.all
    end

    # GET /dashboard/tags/new
    def new
      @tag = Tag.new
    end

    # GET /dashboard/tags/1/edit
    def edit; end

    # POST /dashboard/tags
    def create
      @tag = Tag.new(tag_params)

      if @tag.save
        redirect_to dashboard_tags_url, success: 'Tag was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /dashboard/tags/1
    def update
      if @tag.update(tag_params)
        redirect_to dashboard_tags_url, success: 'Tag was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /dashboard/tags/1
    def destroy
      @tag.destroy
      redirect_to dashboard_tags_url, success: 'Tag was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :identifier)
    end
  end
end
