class CreateContentManagerCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :content_manager_categories do |t|
      t.string :name
      t.string :title
      t.text :desc
      t.string :key
      t.string :slug
      t.timestamps
    end
  end
end
