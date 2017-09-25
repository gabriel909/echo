class Report < ApplicationRecord
  #belongs_to :escola
  belongs_to :aluno
  has_many :image
  has_many :video
end
