class AddAvisoToImage < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :aviso, foreign_key: true
  end
end
