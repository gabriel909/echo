class Aviso < ApplicationRecord
  has_many :aviso
  belongs_to :escola
end
