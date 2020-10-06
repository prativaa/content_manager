class CreateContentManagerAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :content_manager_admins do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
