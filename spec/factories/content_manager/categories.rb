FactoryBot.define do
  factory :content_manager_category, class: 'ContentManager::Category' do
    name { 'MyString' }
    desc { 'MyString' }
    key { 'MyString' }
    title { 'MyString' }
  end
end
