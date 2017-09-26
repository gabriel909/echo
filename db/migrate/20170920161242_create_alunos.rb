class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.string :serie
      t.text :avatar
    end
  end
end
