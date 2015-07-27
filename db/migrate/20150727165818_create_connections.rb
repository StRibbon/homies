class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :user, index: true, foreign_key: true
      t.references :sphere, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
