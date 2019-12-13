class CreatePacientes < ActiveRecord::Migration[5.2]
  def change
    create_table :pacientes do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.string :email

      t.timestamps
    end
  end
end
