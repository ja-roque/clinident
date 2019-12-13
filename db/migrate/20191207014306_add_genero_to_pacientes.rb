class AddGeneroToPacientes < ActiveRecord::Migration[5.2]
  def change
    add_column :pacientes, :genero, :boolean
  end
end
