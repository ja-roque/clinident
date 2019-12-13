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

  def send_csv_email
    citas = Citum.where id: params[:citas_id].split(' ')
    paciente = "#{citas.first.paciente.nombre} #{citas.first.paciente.apellido}"
    csv = generar_historial_paciente_csv citas
    CsvMailer.historial_paciente_csv(current_user.email, paciente, csv).deliver_now

    head :ok
  end

  def download_csv
    citas = Citum.where id: params[:citas_id]
    paciente = "#{citas.first.paciente.nombre} #{citas.first.paciente.apellido}"
    csv = generar_historial_paciente_csv citas
    send_data csv, type: 'text/csv', disposition: "inline", filename: "Historial de #{paciente}.csv"
  end

  def generar_historial_paciente_csv(citas)
    csv = CSV.generate(force_quotes: true) do |line|
      line << ['ID Cita',
               'Medico a cargo',
               'Fecha',
               'Observaciones',
               'Servicio',
               'Procedimiento',
               'Asistencia'
      ]

      citas.each do |cita|
          line << [
             cita.id,
             "#{cita.user.nombre} #{cita.user.apellido}",
             cita.fecha,
             cita.observaciones,
             cita.servicio&.nombre,
             cita.procedimiento,
             cita.asistencia
          ]
      end
    end
    csv
  end


end
