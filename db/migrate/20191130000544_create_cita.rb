class CreateCita < ActiveRecord::Migration[5.2]
  def change
    create_table :cita do |t|
      t.date :fecha
      t.references :user, foreign_key: true
      t.references :paciente, foreign_key: true
      t.text :observaciones
      t.boolean :asistencia

      t.timestamps
    end
  end
end
