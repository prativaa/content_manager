FactoryBot.define do
  factory :content_manager_tag, class: 'ContentManager::Tag' do
    name { 'MyString' }
    key { 'MyString' }
    tag_type { 0 }
  end
end
