class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch
  pg_search_scope :search,  against: [:nombre, :apellido], using: {tsearch: {prefix: true, any_word: true}}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
