class CsvMailer < ApplicationMailer
  def historial_paciente_csv(user_email, paciente, csv)
    attachments['historial.csv'] = {   mime_type: 'text/csv',
                                       content: csv }
    mail(to: user_email, subject: "Historial medico de #{paciente}")
  end
end
