class CreateServicios < ActiveRecord::Migration[5.2]
  def change
    create_table :servicios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
