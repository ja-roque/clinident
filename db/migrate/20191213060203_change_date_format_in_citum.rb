class ChangeDateFormatInCitum < ActiveRecord::Migration[5.2]
  def change
    change_column :cita, :fecha, :datetime
  end
end
