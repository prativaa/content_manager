class CreateContentManagerArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :content_manager_articles do |t|
      t.string :key
      t.integer :status, default: 0
      t.string :title
      t.string :desc
      t.string :ogp
      t.text :body
      t.boolean :recommend, default: false, null: false
      t.string :slug
      t.datetime "published_at"
      t.references :content_manager_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
