module ContentManager
  class Article < ApplicationRecord
    belongs_to :category, :class_name => "ContentManager::Category", :foreign_key => "category_id"

    extend FriendlyId
    friendly_id :key, use: %i[slugged history]

    mount_uploader :ogp, ContentManager::OgpUploader

    validates :key, presence: true, uniqueness: { case_sensitive: true }
    validates :status, :title, :desc, :body, presence: true
    validates :recommend, inclusion: { in: [true, false] }

    delegate :name, to: :category, prefix: true, allow_nil: true

    enum status: %i[draft published closed]

    has_and_belongs_to_many :tags

    scope :recommended_articles, ->() { published.where(recommend: true, super_recommend: false).order('created_at DESC') }
    scope :related_articles, ->(article, limit) { published.where(category: article.category).where.not(id: article.id).order('created_at DESC').limit(limit) }
    scope :paginate_articles, ->(page, limit) { published.order('created_at DESC').page(page).per(limit) }
    # scope :super_recommended_articles, ->(limit) { published.where(super_recommend: true).order('published_at DESC').limit(limit) }

    def change_status(new_status)
      self.status = new_status
      save
    end

    def should_generate_new_friendly_id?
      key_changed?
    end

    def publish
      update(published_at: Time.now)
    end

    def tag_keywords
      tags.each.map(&:name).join(', ')
    end
  end
end