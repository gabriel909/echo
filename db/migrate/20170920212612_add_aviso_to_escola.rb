class AddAvisoToEscola < ActiveRecord::Migration[5.1]
  def change
    add_reference :escolas, :aviso, foreign_key: true
  end
end
