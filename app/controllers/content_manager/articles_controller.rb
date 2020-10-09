require_dependency "content_manager/application_controller"

module ContentManager
  class ArticlesController < ApplicationController
    # before_action :tags
    before_action :recent_articles
    before_action :set_category, only: :create
    before_action :set_article, only: %i[edit update destroy]
    include ContentManager::SessionsHelper

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
      @categories = Category.all.order('name ASC')
      # @conversions = Conversion.all
      # @site_name = site_name
    end

    def create
      @article = @category.articles.new(article_params)
      if @article.valid?
        @article.save
        @article.publish if @article.status == 'published'

        flash[:notice] = 'Article created successfully.'
        redirect_to '/content_manager/articles'
      else
        redirect_to '/content_manager/articles/new'
      end
    end

    def edit
      # @categories = Category.all.order('name ASC')
      # @conversions = Conversion.all
    end

    # rubocop:disable Metrics/AbcSize
    def update
      @article.update(article_params) if params[:article]
      @article.change_status(params[:status]) unless params[:status].nil?

      if @article.valid?
        @article.save
        flash[:notice] = 'Article updated successfully.'
        redirect_to 'content_manager/articles'
      else
        render :edit
      end
    end

    def destroy
      if @article.destroy
        flash[:notice] = 'Article deleted successfully.'
        redirect_to articles_path
      else
        flash[:alert] = 'Error deleting article.'
      end
    end

    private

    def article_params
      params.require(:article).permit(
        :key,
        :status,
        :title,
        :desc,
        :ogp,
        :ogp_cache,
        :body,
        :recommend,
        :category_id
      )
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:article][:category_id])
    end

    # def clean_conversion_ids
    #   params[:article][:conversion_ids][0].split(',').unshift('')
    # end

    # def save_article(article)
    #   article.conversion_ids = clean_conversion_ids
    #   article.save
    # end
  end
end
