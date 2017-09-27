class Aviso < ApplicationRecord
  has_many :image
  belongs_to :escola
end
