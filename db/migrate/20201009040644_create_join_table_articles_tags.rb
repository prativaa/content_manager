class CreateJoinTableArticlesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :content_manager_articles_tags do |t|
      t.bigint :article_id
      t.bigint :tag_id

      t.timestamps
    end
    add_index :content_manager_articles_tags, :tag_id, name: :index_content_manager_articles_on_tag_id

    add_index :content_manager_articles_tags, :article_id, name: :index_content_manager_tags_on_article_id
  end
end
