class CreateEspecialidads < ActiveRecord::Migration[5.2]
  def change
    create_table :especialidads do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
