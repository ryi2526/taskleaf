class UsersPassworddigiest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Password_digest, :password_digest
  end
end
