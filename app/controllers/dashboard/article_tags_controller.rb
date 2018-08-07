module Dashboard
  class ArticleTagsController < Dashboard::ApplicationController
    before_action :set_article_tag, only: %i[destroy]

    # POST /dashboard/articles/1/article_tags
    def create
      article = Article.find(params[:article_id])
      article_tag = ArticleTag.new(article_tag_params)
      article_tag.article_id = params[:article_id]
      if article_tag.save
        redirect_to [:dashboard, article], success: 'Article tag was successfully created.'
      else
        redirect_to [:dashboard, article]
      end
    end

    # DELETE /dashboard/article_tags/1
    def destroy
      article = @article_tag.article
      @article_tag.destroy
      redirect_to [:dashboard, article], success: 'Article tag was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_article_tag
      @article_tag = ArticleTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_tag_params
      params.require(:article_tag).permit(:tag_id)
    end
  end
end
