require 'rails_helper'

module ContentManager
  RSpec.describe Article, type: :model do
  
    subject { described_class.new(key: 'test', status: 0,
    title: 'MyString', desc: 'MyString', body: 'MyString', recommend: 'true', content_manager_category_id: 1) }

    it 'is not valid without a category_id' do
      subject.content_manager_category_id = nil
      expect(subject).to_not be_valid
    end

    # it 'is valid with valid attributes' do
    #   expect(subject).to be_valid
    # end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a key' do
      subject.key = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate key' do
      subject.save
      new_article = Article.new(key: 'test', status: 0,
      title: 'MyString1', desc: 'MyString1', body: 'MyString1', recommend: 'true')

      expect(new_article).to_not be_valid
    end
  end
end
