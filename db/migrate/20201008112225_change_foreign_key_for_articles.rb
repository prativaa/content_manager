class ChangeForeignKeyForArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :content_manager_articles, :content_manager_category_id, :category_id
  end
end
