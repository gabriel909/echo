class CreateAvisos < ActiveRecord::Migration[5.1]
  def change
    create_table :avisos do |t|
      t.string :titulo
      t.string :series
      t.string :descricao
      t.references :image, foreign_key: true
      t.belongs_to :escola, index: true

      t.timestamps
    end
  end
end
