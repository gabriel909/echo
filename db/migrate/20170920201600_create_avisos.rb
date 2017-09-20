class CreateAvisos < ActiveRecord::Migration[5.1]
  def change
    create_table :avisos do |t|
      t.string :titulo
      t.string :descrição
      t.string :series
      t.string :imagem

      t.timestamps
    end
  end
end
