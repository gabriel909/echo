class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.string :serie
      t.string :password_digest
      t.belongs_to :escola, index: true
      t.references :report, foreign_key: true
    end
  end
end
