require 'rails_helper'

module ContentManager
  RSpec.describe Category, type: :model do
    let(:category) { FactoryBot.create(:content_manager_category) }


    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    # it 'is not valid without a title' do
    #   subject.title = nil
    #   expect(subject).to_not be_valid
    # end

    # it 'is not valid without a key' do
    #   subject.key = nil
    #   expect(subject).to_not be_valid
    # end

    # it 'is not valid with duplicate key' do
    #   subject.save
    #   new_article = Article.new(key: 'test', status: 0,
    #   title: 'MyString1', desc: 'MyString1', body: 'MyString1', recommend: 'true')

    #   expect(new_article).to_not be_valid
    # end
  end
end
