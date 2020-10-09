class AddCategoryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :content_manager_articles, :content_manager_category, foreign_key: true
  end
end
