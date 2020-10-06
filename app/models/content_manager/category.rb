# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  key        :string(255)
#  slug       :string(255)
#  title      :string(255)
#
module ContentManager
  class Category < ApplicationRecord
    has_many :articles
    validates :name, :desc, :key, presence: true

    # extend FriendlyId
    # friendly_id :key, use: %i[slugged history]

    # def should_generate_new_friendly_id?
    #   key_changed?
    # end
  end
end