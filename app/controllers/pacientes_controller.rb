class PacientesController < ApplicationController
  def index
    @pacientes = Paciente.
        left_outer_joins(:citums).
        select('pacientes.*, cita.fecha AS proxima_cita').
        order('cita.fecha DESC').
        group(:id, 'cita.fecha')
  end

  def nuevo
    @paciente_nuevo = Paciente.new
  end

  def create
    paciente_nuevo = Paciente.new(allowed_params)
    if paciente_nuevo.valid?
      paciente_nuevo.save
      render :index
    else
      render :index
    end
  end

  def allowed_params
    params.require(:paciente).permit(Paciente.column_names - ["created_at", "updated_at"])
  end
end
