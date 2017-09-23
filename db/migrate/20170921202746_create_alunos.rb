class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.string :serie
      t.text :avatar
      t.string :password_digest
      t.belongs_to :escola, index:true
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
