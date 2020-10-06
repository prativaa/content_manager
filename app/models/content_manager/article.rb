# == Schema Information
#
# Table name: articles
#
#  id              :integer          not null, primary key
#  key             :string(255)
#  status          :integer          default("draft")
#  title           :string(255)
#  desc            :string(255)
#  ogp             :string(255)
#  body            :text(65535)
#  recommend       :boolean          default(FALSE), not null
#  slug            :string(255)
#  published_at    :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer
#  super_recommend :boolean          default(FALSE), not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
module ContentManager
  class Article < ApplicationRecord
    belongs_to :category

    # extend FriendlyId
    # friendly_id :key, use: %i[slugged history]

    # mount_uploader :ogp, OgpUploader

    validates :key, presence: true, uniqueness: true
    validates :status, :title, :desc, :body, presence: true
    validates :recommend, inclusion: { in: [true, false] }
    # validates :super_recommend, inclusion: { in: [true, false] }
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

    # def should_generate_new_friendly_id?
    #   key_changed?
    # end

    def publish
      update(published_at: Time.now)
    end

    def tag_keywords
      tags.each.map(&:name).join(', ')
    end
  end
end