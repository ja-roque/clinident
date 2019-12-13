class Paciente < ApplicationRecord
  include PgSearch
  pg_search_scope :search,  against: [:nombre, :apellido], using: {tsearch: {prefix: true, any_word: true}}
  has_many :citums, inverse_of: :paciente

end
