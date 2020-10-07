class CreateContentManagerTags < ActiveRecord::Migration[5.1]
  def change
    create_table :content_manager_tags do |t|
      t.string :name
      t.string :key
      t.integer :tag_type
      t.timestamps
    end
  end
end
