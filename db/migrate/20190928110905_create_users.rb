class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :UserID, null:false
      t.string :UserName, null:false
      t.string :Password_digest, null:false

      t.timestamps
      t.index :UserID, unique: true
    end
  end
end
