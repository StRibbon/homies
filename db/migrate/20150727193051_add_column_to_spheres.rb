class AddColumnToSpheres < ActiveRecord::Migration
  def change
    add_column :spheres, :owner_id, :string
  end
end
