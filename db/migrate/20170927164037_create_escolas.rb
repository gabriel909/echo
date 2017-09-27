class CreateEscolas < ActiveRecord::Migration[5.1]
  def change
    create_table :escolas do |t|
      t.string :cnpj
      t.string :email
      t.string :password_digest
      t.string :unidade
      t.references :aviso, foreign_key: true
      t.references :report, foreign_key: true
      t.references :aluno, foreign_key: true
    end
  end
end
