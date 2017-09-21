class Aluno < ApplicationRecord
  has_secure_password
  has_many :report
  belongs_to :escola
end
