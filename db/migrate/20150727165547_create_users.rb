class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :img_url

      t.timestamps null: false
    end
  end
end
