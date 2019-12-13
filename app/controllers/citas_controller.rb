class CitasController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @citas = Citum.all.order('fecha DESC')
  end

  def nuevo
    @cita_nueva = Citum.new
  end

  def create
    @cita_nueva = Citum.new(allowed_params)
    if @cita_nueva.valid?
      @cita_nueva.save
      redirect_to cita_nueva_path
    else
      render :index
    end
  end

  def marcar_asistencia
    cita = Citum.find params[:cita_id]
    cita.update asistencia: true, procedimiento: params[:procedimiento]
    head :ok
  end

  def allowed_params
    params.require(:cita).permit(Citum.column_names - ["created_at", "updated_at"])
  end

end
