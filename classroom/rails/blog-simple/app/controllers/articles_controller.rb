class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.last_published.all
  end

  # GET /articles/:id
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/:id/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(set_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  # PATCH/PUT /articles/:id
  def update
    if @article.update(set_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  # DELETE /artiles/:id
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def set_articles
      @article = Article.find(params[:id])
    end

    def set_params
      params.require(:article).permit(:title,:text)
    end
end
