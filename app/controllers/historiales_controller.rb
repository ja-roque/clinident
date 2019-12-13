class HistorialesController < ApplicationController
  def index

  end

  def por_paciente
    @pacientes = params[:search].present? && Paciente.search(params[:search]) ||  Paciente.order('nombre DESC')
  end

  def historial_paciente
    @paciente = Paciente.find params[:paciente_id]
    @citas = @paciente.citums.order('fecha DESC')
  end

  def por_medico
    @pacientes = params[:search].present? && Paciente.search(params[:search]) ||  Paciente.order('nombre DESC')
  end

  def por_procedimiento
    @pacientes = params[:search].present? && Paciente.search(params[:search]) ||  Paciente.order('nombre DESC')
  end

  def por_rango_de_fecha
    @pacientes = params[:search].present? && Paciente.search(params[:search]) ||  Paciente.order('nombre DESC')
  end


end
