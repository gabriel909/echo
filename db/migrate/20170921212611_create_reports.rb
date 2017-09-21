class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :categoria
      t.string :descrição
      t.string :status
      t.string :images, array: true, default: []
      t.string :videos, array: true, default: []

      t.timestamps
    end
  end
end
