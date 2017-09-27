class CreateAvisos < ActiveRecord::Migration[5.1]
  def change
    create_table :avisos do |t|
      t.string "titulo"
      t.string "series"
      t.text "descricao"
    end
  end
end
