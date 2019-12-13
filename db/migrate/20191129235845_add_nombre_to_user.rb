class AddNombreToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :especialidad, :string
    add_column :users, :estado, :string
  end
end
