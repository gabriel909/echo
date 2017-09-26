class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.string :serie
      t.text :avatar
      t.references :escola, foreign_key: true
      t.references :report, foreign_key: true
    end
  end
end
