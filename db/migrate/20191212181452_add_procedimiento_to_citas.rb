class AddProcedimientoToCitas < ActiveRecord::Migration[5.2]
  def change
    add_column :cita, :procedimiento, :text
  end
end
