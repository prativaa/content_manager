module ContentManager
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :categories

    def categories
      @categories = Category.all
    end

    def tags
      @tags_article = Tag.where(tag_type: [nil, "article"])
    end

    def recent_articles
      @recent_articles = Article.published.where(recommend: false).order('created_at DESC').limit(4)
    end
  end
end
