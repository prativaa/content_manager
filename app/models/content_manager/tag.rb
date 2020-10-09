module ContentManager
  class Tag < ApplicationRecord
    validates :name, presence: true
    validates :key, presence: true, uniqueness: { case_sensitive: true }
    has_and_belongs_to_many :articles

    enum tag_type: %i[article facility treatment]

    extend FriendlyId
    friendly_id :key, use: %i[slugged history]

    def should_generate_new_friendly_id?
      key_changed?
    end
  end
end
