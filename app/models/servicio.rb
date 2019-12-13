class Servicio < ApplicationRecord
  has_many :citums, inverse_of: :servicio
end