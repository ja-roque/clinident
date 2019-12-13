class AddServicioToCita < ActiveRecord::Migration[5.2]
  def change
    add_reference :cita, :servicio, foreign_key: true
  end
end
