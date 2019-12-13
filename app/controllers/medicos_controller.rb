class MedicosController < ApplicationController
  def index
    @medicos = params[:search].present? && User.search(params[:search]) ||  User.order('nombre DESC')
  end

  def nuevo
    @medico_nuevo = User.new
  end

  def create
    @medico_nuevo = User.new(allowed_params)
    if @medico_nuevo.valid?
      @medico_nuevo.save
      redirect_to medico_nuevo_path
    else
      render :index
    end
  end

  def allowed_params
    params.require(:medico).permit(User.column_names + [:password, :password_confirmation] - ["created_at", "updated_at"])
  end
end
