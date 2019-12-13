Rails.application.routes.draw do
  get 'historiales/index'
  get 'medicos/index'
  get 'citas/index'
  get 'pacientes/index'
  get 'patients/index'
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  unauthenticated do
    root :to => 'home#index'
  end

  authenticated do
    root :to => 'dashboard#index'

    get  '/pacientes'       => 'pacientes#index',   as: :pacientes
    get  '/pacientes/search'=> 'pacientes#search',  as: :pacientes_search
    get  '/pacientes/nuevo' => 'pacientes#nuevo',   as: :paciente_nuevo
    post '/pacientes/create'=> 'pacientes#create',  as: :create_paciente

    get  '/citas'           => 'citas#index',       as: :citas
    get  '/citas/nuevo'     => 'citas#nuevo',       as: :cita_nueva
    post '/citas/create'    => 'citas#create',      as: :create_cita
    post '/citas/marcar_asistencia'  => 'citas#marcar_asistencia',    as: :marcar_asistencia


    get  '/medicos'         => 'medicos#index',     as: :medicos
    get  '/medicos/nuevo'   => 'medicos#nuevo',    as: :medico_nuevo
    post '/medicos/create'  => 'medicos#create',    as: :create_medico

    get  '/historiales'     => 'historiales#index', as: :historiales
    get  '/historiales/pacientes' => 'historiales#por_paciente', as: :historiales_pacientes
    get  '/historiales/pacientes/:paciente_id' => 'historiales#historial_paciente', as: :historial_paciente

    # Descargas
    post  '/historiales/pacientes/:paciente_id/mail'=> 'historiales#send_csv_email', as: :historial_paciente_email
    post  '/historiales/pacientes/:paciente_id/csv' => 'historiales#download_csv',   as: :historial_paciente_csv
  end

end
