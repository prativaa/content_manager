FactoryBot.define do
  factory :content_manager_article, class: 'ContentManager::Article' do
    key { 'MyString'}
    status { 0 }
    title { 'MyString' } 
    desc { 'MyString' } 
    body { 'MyString' }
    recommend { 'true' }
    # category { FactoryBot.create(:content_manager_category) }
  end
end
