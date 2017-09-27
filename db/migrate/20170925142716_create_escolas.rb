class CreateEscolas < ActiveRecord::Migration[5.1]
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :cnpj
      t.string :email
      t.string :password_digest
      t.string :unidade
      # t.references :aviso, foreign_key: true
      t.timestamps
    end
  end
end
