module ContentManager
  class Category < ApplicationRecord
    has_many :articles
    validates :name, :desc, :key, presence: true

    extend FriendlyId
    friendly_id :key, use: %i[slugged history]

    def should_generate_new_friendly_id?
      key_changed?
    end
  end
end