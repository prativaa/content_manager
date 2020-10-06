# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  key        :string(255)
#  slug       :string(255)
#  tag_type   :integer
#
module ContentManager
  class Tag < ApplicationRecord
    validates :name, presence: true
    validates :key, presence: true, uniqueness: true
    has_and_belongs_to_many :articles

    enum tag_type: %i[article facility treatment]

    # extend FriendlyId
    # friendly_id :key, use: %i[slugged history]

    # def should_generate_new_friendly_id?
    #   key_changed?
    # end
  end
end
