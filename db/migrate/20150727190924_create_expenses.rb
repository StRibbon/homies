class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :notes
      t.float :cost
      t.integer :user_id
      t.integer :sphere_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
