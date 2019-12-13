class Citum < ApplicationRecord
  belongs_to :user
  belongs_to :paciente
  belongs_to :servicio
end
