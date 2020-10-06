require 'rails_helper'

module ContentManager
  RSpec.describe Tag, type: :model do
    let(:tag) { FactoryBot.create(:content_manager_tag) }

    it 'is valid with valid attributes' do
      expect(tag).to be_valid
    end

  end
end
