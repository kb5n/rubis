module Dashboard
  class ArticlesController < Dashboard::ApplicationController
    before_action :set_article, only: %i[show edit update destroy]
    before_action :set_options, except: %i[index]

    layout 'dashboard/application'

    # GET /dashboard/articles
    def index
      @articles = Article.where(user_id: current_user.id).all.order('published_at desc')
    end

    # GET /dashboard/articles/1
    def show; end

    # GET /dashboard/articles/new
    def new
      @article = Article.new(user_id: current_user.id, status: :draft)
    end

    # GET /dashboard/articles/1/edit
    def edit; end

    # POST /dashboard/articles
    def create
      @article = Article.new(article_params)
      @article.user_id = current_user.id
      @article.status = :draft

      if @article.save
        redirect_to [:dashboard, @article], success: 'Article was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /dashboard/articles/1
    def update
      if @article.update(article_params)
        redirect_to [:dashboard, @article], id: @article.id, success: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /dashboard/articles/1
    def destroy
      @article.destroy
      redirect_to dashboard_articles_url, success: 'Article was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_options
      @categories = Category.where(user_id: current_user.id).all
      @tags = Tag.where(user_id: current_user.id).all
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :identifier, :category_id, :published_at, :status)
    end
  end
end
