class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :categoria
      t.string :descrição
      t.string :status
      t.string :images, array: true, default: []
      t.string :videos, array: true, default: []
      t.belongs_to :escola, index:true
      t.belongs_to :aluno, index:true


      t.timestamps
    end
  end
end
