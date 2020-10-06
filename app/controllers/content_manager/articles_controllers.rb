require_dependency "content_manager/application_controller"

module ContentManager
  class ArticlesController < ApplicationController
  before_action :tags
  before_action :recent_articles
  include SessionsHelper

  def index
    binding.pry
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.new
    @categories = Category.all.order('name ASC')
    # @conversions = Conversion.all
    # @site_name = site_name
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      @article.publish if @article.status == 'published'

      flash[:notice] = 'Article created successfully.'
      redirect_to '/admin/articles'
    else
      redirect_to '/admin/articles/new'
    end
  end

  def edit
    @categories = Category.all.order('name ASC')
    # @conversions = Conversion.all
  end

  # rubocop:disable Metrics/AbcSize
  def update
    @article.update(article_params) if params[:article]
    @article.change_status(params[:status]) unless params[:status].nil?

    if @article.valid?
      @article.save
      flash[:notice] = 'Article updated successfully.'
      redirect_to '/admin/articles'
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article deleted successfully.'
      redirect_to admin_articles_path
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

  # def clean_conversion_ids
  #   params[:article][:conversion_ids][0].split(',').unshift('')
  # end

  # def save_article(article)
  #   article.conversion_ids = clean_conversion_ids
  #   article.save
  # end
end
