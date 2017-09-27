class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :categoria
      t.string :status
      t.string :descricao
      t.references :image, foreign_key: true
      t.references :video, foreign_key: true
      t.belongs_to :aluno, index: true
      t.belongs_to :escola, index: true
    end
  end
end
