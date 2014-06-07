class ArticlesController < ApplicationController
  def create
    @article = Article.new article_params

    generate_slug if @article.title

    if @article.save
      redirect_to articles_url, notice: 'Artigo salvo com sucesso!'
    else
      flash.notice = 'Erro ao salvar o artigo.'
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def article_params
    params.require(:article).permit :body, :title
  end

  private

  def generate_slug
    @article.slug = Article.slug @article.title
  end
end
