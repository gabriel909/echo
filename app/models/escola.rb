class Escola < ApplicationRecord
  has_secure_password
  has_many :aviso
  has_many :aluno
  # has_many :report
end
