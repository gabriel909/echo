class Escola < ApplicationRecord
  has_secure_password
  has_many :aviso
end
